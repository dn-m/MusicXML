//
//  Deserializer.swift
//  MusicXML
//
//  Created by James Bean on 12/2/18.
//

import SWXMLHash

extension MusicXML {

    // TODO: Create a different `Error` type for each `file` and `elements` subtask.
    enum Error: Swift.Error {
        case invalidDurationType(XMLIndexer)
    }

    // TODO: Implement `traverseTimewise(...)`. This implementation only works for
    // `part-wise`-defined scores.
    public static func deserialize(_ string: String) throws -> Score {
        let xml: XMLIndexer = SWXMLHash.parse(string)
        let partwise: XMLIndexer = xml["score-partwise"]
        return try traversePartwise(partwise)
    }
}
