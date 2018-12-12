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

    // MARK: Measure Notes

    static func deserializeMeasureNotes(_ measureIndexer: XMLIndexer) throws -> [Note] {
        return try measureIndexer["note"].all.compactMap(deserializeNote)
    }
}
