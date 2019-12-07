//
//  Technical.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Technical indications give performance information for individual instruments.
public struct Technical {
    // MARK: - Instance Properties

    // MARK: Value

    public var values: [Technique]

    // MARK: - Initializers

    public init(_ values: [Technique]) {
        self.values = values
    }
}

extension Technical: Equatable {}
extension Technical: Codable {
    // MARK: - Codable

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        values = try container.decode([Technique].self)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        try values.encode(to: encoder)
    }
}

import XMLCoder
// sourcery:inline:Technical.DynamicNodeEncoding
extension Technical: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end
