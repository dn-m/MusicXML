//
//  Parser.swift
//  MusicXML
//
//  Created by James Bean on 12/2/18.
//

import SWXMLHash

extension MusicXML {

    enum Error: Swift.Error {
        case invalidPartList(XMLIndexer)
        case invalidScorePart(XMLIndexer)
        case invalidPart(XMLIndexer)
        case invalidMeasure(XMLIndexer)
    }

    static func parse(_ string: String) throws -> Score {
        let xml = SWXMLHash.parse(string)
        let partwise = xml["score-partwise"]
        return try traversePartWise(partwise)
    }

    static func traversePartWise(_ scoreIndexer: XMLIndexer) throws -> Score {
        let partList = try extractPartList(from: scoreIndexer)
        let parts = try extractParts(from: scoreIndexer)
        partList.forEach { print($0) }
        return Score(
            traverse: .partWise(
                PartWise(
                    partList: partList,
                    parts: parts
                )
            )
        )
    }

    static func extractPartList(from scoreIndexer: XMLIndexer) throws -> [ScorePart] {
        return try scoreIndexer["part-list"].children.map(parseScorePart)
    }

    static func parseScorePart(_ scorePartIndexer: XMLIndexer) throws -> ScorePart {
        guard
            let id = scorePartIndexer.element?.attribute(by: "id")?.text,
            let name = scorePartIndexer["part-name"].element?.text
        else {
            throw Error.invalidPartList(scorePartIndexer)
        }
        return ScorePart(id: id, name: name)
    }

    static func extractParts(from scoreIndexer: XMLIndexer) throws -> [Part] {
        return try scoreIndexer["part"].all.map(parsePart)
    }

    static func parsePart(_ partIndexer: XMLIndexer) throws -> Part {
        guard let id = partIndexer.element?.attribute(by: "id")?.text else {
            throw Error.invalidPart(partIndexer)
        }
        let measures = try partIndexer["measure"].all.map(parseMeasure)
        return Part(id: id, measures: measures)
    }

    // MARK: - Measure

    static func parseMeasure(_ measureIndexer: XMLIndexer) throws -> Measure {
        guard let number = parseMeasureNumber(measureIndexer) else {
            throw Error.invalidMeasure(measureIndexer)
        }
        let attributes = parseMeasureAttributes(measureIndexer)
        let notes = parseMeasureNotes(measureIndexer)
        return Measure(number: number, attributes: attributes, notes: notes)
    }

    static func parseMeasureNumber(_ measureIndexer: XMLIndexer) -> Int? {
        let numberString = measureIndexer.element?.attribute(by: "number")?.text
        return numberString.flatMap { Int($0) }
    }

    // MARK: Measure Attributes

    static func parseMeasureAttributes(_ measureIndexer: XMLIndexer) -> [Measure.Attribute] {
        let attributesIndexer = measureIndexer["attributes"]
        let maybeDivisions = parseMeasureDivisions(attributesIndexer)
        let maybeKey = parseMeasureKey(attributesIndexer)
        let maybeTime = parseMeasureTime(attributesIndexer)
        let maybeClef = parseMeasureClef(attributesIndexer)
        var result: [Measure.Attribute] = []
        if let divisions = maybeDivisions { result.append(.divisions(divisions)) }
        if let key = maybeKey { result.append(.key(key)) }
        if let time = maybeTime { result.append(.time(time.0, time.1)) }
        if let clef = maybeClef { result.append(.clef(clef)) }
        return result
    }

    static func parseMeasureDivisions(_ attributesIndexer: XMLIndexer) -> Int? {
        let divisionsString = attributesIndexer["divisions"].element?.text
        return divisionsString.flatMap { Int($0) }
    }

    static func parseMeasureKey(_ attributesIndexer: XMLIndexer) -> Key? {
        let fifthsString = attributesIndexer["key"]["fifths"].element?.text
        return fifthsString.flatMap { Int($0) }.map { Key(fifths: $0) }
    }

    static func parseMeasureClef(_ attributesIndexer: XMLIndexer) -> Clef? {
        let lineString = attributesIndexer["clef"]["line"].element?.text
        guard
            let sign = attributesIndexer["clef"]["sign"].element?.text,
            let line = lineString.flatMap({ Int($0) })
        else {
            return nil
        }
        return Clef(sign: sign, line: line)
    }

    static func parseMeasureTime(_ attributesIndexer: XMLIndexer) -> (Int,Int)? {
        let beatsString = attributesIndexer["time"]["beats"].element?.text
        let subdivisionString = attributesIndexer["time"]["beat-type"].element?.text
        guard
            let beats = beatsString.flatMap({ Int($0) }),
            let subdivision = subdivisionString.flatMap({ Int($0) })
        else {
            return nil
        }
        return (beats,subdivision)
    }

    // MARK: Measure Notes

    static func parseMeasureNotes(_ measureIndexer: XMLIndexer) -> [Note] {
        return measureIndexer["note"].all.compactMap(parseNote)
    }

    static func parseNote(_ noteIndexer: XMLIndexer) -> Note? {
        guard
            let pitch = parsePitch(noteIndexer),
            let duration = parseDuration(noteIndexer),
            let type = parseDurationType(noteIndexer)
        else {
            return nil
        }
        return Note(pitch: pitch, duration: duration, type: type)
    }

    static func parsePitch(_ noteIndexer: XMLIndexer) -> Pitch? {
        guard
            let step = noteIndexer["pitch"]["step"].element?.text,
            let octaveString = noteIndexer["pitch"]["octave"].element?.text,
            let octave = Int(octaveString)
        else {
            return nil
        }
        return Pitch(step: step, octave: octave)
    }

    static func parseDuration(_ noteIndexer: XMLIndexer) -> Int? {
        let durationString = noteIndexer["duration"].element?.text
        return durationString.flatMap { Int($0) }
    }

    static func parseDurationType(_ noteIndexer: XMLIndexer) -> DurationType? {
        let durationTypeString = noteIndexer["type"].element?.text
        return durationTypeString.flatMap(DurationType.init(rawValue:))
    }
}
