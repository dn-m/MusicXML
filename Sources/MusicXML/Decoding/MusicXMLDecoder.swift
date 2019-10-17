//
//  MusicXMLDecoder.swift
//  MusicXML
//
//  Created by James Bean on 10/17/19.
//

import XMLCoder

public class MusicXMLDecoder: XMLDecoder {

    // MARK: - Initializers

    public init() {
        super.init(trimValueWhitespaces: false)
    }

    // MARK: - Instance Methods

    public func decode<T>(_ type: T.Type, from string: String) throws -> T where T: Decodable {
        return try decode(type, from: string.data(using: .utf8)!)
    }
}
