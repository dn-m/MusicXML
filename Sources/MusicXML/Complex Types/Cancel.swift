//
//  Cancel.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// A cancel element indicates that the old key signature should be cancelled before the new one
/// appears. This will always happen when changing to C major or A minor and need not be specified
/// then. The cancel value matches the fifths value of the cancelled key signature (e.g., a cancel
/// of -2 will provide an explicit cancellation for changing from B flat major to F major).
public struct Cancel {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let location: CancelLocation?

    // MARK: Value

    public let fifths: Int

    // MARK: - Initializers

    public init(_ fifths: Int, location: CancelLocation?) {
        self.fifths = fifths
        self.location = location
    }
}

extension Cancel: Equatable {}
extension Cancel: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case location
        case fifths = ""
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fifths = try container.decode(Int.self, forKey: .fifths)
        self.location = try container.decodeIfPresent(CancelLocation.self, forKey: .location)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encode(fifths, forKey: .fifths)
    }
}

import XMLCoder
// sourcery:inline:Cancel.DynamicNodeEncoding
extension Cancel: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.location:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end
