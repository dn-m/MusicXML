//
//  PartwiseDeserializer.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//

import SWXMLHash

extension MusicXML {

    static func traversePartwise(_ scoreIndexer: XMLIndexer) throws -> Score {
        return Score(
            traverse: .partwise(
                Partwise(
                    partList: try deserializePartList(from: scoreIndexer),
                    parts: try deserializeParts(from: scoreIndexer)
                )
            )
        )
    }


    static func deserializeParts(from scoreIndexer: XMLIndexer) throws -> [Part] {
        return try scoreIndexer["part"].all.map(deserializePart)
    }

    static func deserializePart(_ partIndexer: XMLIndexer) throws -> Part {
        return Part(
            id: try partIndexer.value(ofAttribute: "id"),
            measures: try partIndexer["measure"].all.map(deserializeMeasure)
        )
    }
}
