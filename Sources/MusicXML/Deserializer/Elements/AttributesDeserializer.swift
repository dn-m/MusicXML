//
//  AttributesDeserializer.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//

import SWXMLHash

extension MusicXML {

    static func deserializeAttributes(_ measureIndexer: XMLIndexer) -> [Measure.Attribute] {
        let attributesIndexer = measureIndexer["attributes"]

        // FIXME: For optional attributes, discriminate values which don't exist, and those which
        // actually fail to deserialize!
        //
        // TODO: Refactor `Measure` so that each optional attribute is an `Optional` value, rather
        // than built on top of an array of `Attribute` (`enum`) values.
        let maybeDivisions = try? deserializeDivisions(attributesIndexer)
        let maybeKey = try? deserializeKey(attributesIndexer)
        let maybeTime = try? deserializeTime(attributesIndexer)
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
        return Key(kind:
            .traditional(
                Key.Kind.Traditional(
                    fifths: try attributesIndexer["key"]["fifths"].value(),
                    cancel: nil,
                    mode: nil
                )
            ),
            number: nil,
            octaves: nil,
            id: nil
        )
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

    static func deserializeTime(_ attributesIndexer: XMLIndexer) throws -> (Int,Int) {
        return (
            try attributesIndexer["time"]["beats"].value(),
            try attributesIndexer["time"]["beat-type"].value()
        )
    }
}
