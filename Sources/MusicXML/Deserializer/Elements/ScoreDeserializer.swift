//
//  ScoreDeserializer.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//

import SWXMLHash

extension MusicXML {

    // MARK: - Part Metadata

    static func deserializePartList(from scoreIndexer: XMLIndexer) throws -> [ScorePart] {
        return try scoreIndexer["part-list"].children.map(deserializeScorePart)
    }

    static func deserializeScorePart(_ scorePartIndexer: XMLIndexer) throws -> ScorePart {
        return ScorePart(
            id: try scorePartIndexer.value(ofAttribute: "id"),
            name: try scorePartIndexer["part-name"].value()
        )
    }

    // MARK: - Measure

    static func deserializeMeasure(_ measureIndexer: XMLIndexer) throws -> Measure {
        return Measure(
            number: try deserializeMeasureNumber(measureIndexer),
            attributes: deserializeAttributes(measureIndexer),
            notes: try deserializeMeasureNotes(measureIndexer)
        )
    }

    static func deserializeMeasureNumber(_ measureIndexer: XMLIndexer) throws -> Int {
        return try measureIndexer.value(ofAttribute: "number")
    }

    // MARK: Measure Attributes

    static func deserializeAttributes(_ measureIndexer: XMLIndexer) -> [Measure.Attribute] {
        let attributesIndexer = measureIndexer["attributes"]

        // FIXME: For optional attributes, discriminate values which don't exist, and those which
        // actually fail to deserialize!
        //
        // TODO: Refactor `Measure` so that each optional attribute is an `Optional` value, rather
        // than built on top of an array of `Attribute` (`enum`) values.
        let maybeDivisions = try? deserializeDivisions(attributesIndexer)
        let maybeKey = try? deserializeKey(attributesIndexer)
        let maybeTime = try? deserializeMeasureTime(attributesIndexer)
        let maybeClef = try? deserializeClef(attributesIndexer)
        var result: [Measure.Attribute] = []
        if let divisions = maybeDivisions { result.append(.divisions(divisions)) }
        if let key = maybeKey { result.append(.key(key)) }
        if let time = maybeTime { result.append(.time(time.0, time.1)) }
        if let clef = maybeClef { result.append(.clef(clef)) }
        return result
    }

    static func deserializeDivisions(_ attributesIndexer: XMLIndexer) throws -> Int {
        return try attributesIndexer["divisions"].value()
    }

    static func deserializeKey(_ attributesIndexer: XMLIndexer) throws -> Key {
        return Key(fifths: try attributesIndexer["key"]["fifths"].value())
    }

    static func deserializeClef(_ attributesIndexer: XMLIndexer) throws -> Clef {
        guard let sign = Clef.Sign(rawValue: try attributesIndexer["clef"]["sign"].value()) else {
            throw Error.invalidClef(attributesIndexer)
        }
        return Clef(
            sign: sign,
            line: try attributesIndexer["clef"]["line"].value()
        )
    }

    static func deserializeMeasureTime(_ attributesIndexer: XMLIndexer) throws -> (Int,Int) {
        return (
            try attributesIndexer["time"]["beats"].value(),
            try attributesIndexer["time"]["beat-type"].value()
        )
    }

    // MARK: Measure Notes

    static func deserializeMeasureNotes(_ measureIndexer: XMLIndexer) throws -> [Note] {
        return try measureIndexer["note"].all.compactMap(deserializeNote)
    }
}
