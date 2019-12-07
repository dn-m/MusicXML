//
//  Articulations.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

// FIXME: Consider just storing an `[Articulation]` rather than having a dedicated wrapping struct.
public struct Articulations {
    // MARK: - Instance Properties

    let values: [Articulation]

    // MARK: - Initializers

    public init(_ values: [Articulation]) {
        self.values = values
    }
}

extension Articulations: Equatable {}

extension Articulations: Codable {
    // MARK: - Codable

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.values = try container.decode([Articulation].self)
    }
}

import XMLCoder
// sourcery:inline:Articulations.DynamicNodeEncoding
extension Articulations: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end
