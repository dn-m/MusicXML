//
//  Technical.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Technical indications give performance information for individual instruments.
public struct Technical {
    // MARK: - Instance Properties

    public var values: [Technique]

    public init(_ values: [Technique]) {
        self.values = values
    }
}

extension Technical: Equatable {}
extension Technical: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        values = try container.decode([Technique].self)
    }

    public func encode(to encoder: Encoder) throws {
        try values.encode(to: encoder)
    }
}
