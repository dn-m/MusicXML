//
//  Mordent.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The mordent type is used for both represents the mordent sign with the vertical line and the
/// inverted-mordent sign without the line. The long attribute is "no" by default.
public struct Mordent {
    // MARK: - Instance Properties

    public let value: PrintStyleTrillSound
    public let long: Bool?
    public let approach: AboveBelow?
    public let departure: AboveBelow?

    // MARK - Initializers

    public init(
        value: PrintStyleTrillSound = PrintStyleTrillSound(),
        long: Bool? = nil,
        approach: AboveBelow? = nil,
        departure: AboveBelow? = nil
    ) {
        self.value = value
        self.long = long
        self.approach = approach
        self.departure = departure
    }
}

extension Mordent: Equatable {}
extension Mordent: Codable {
    enum CodingKeys: String, CodingKey {
        case long
        case approach
        case departure
        case value = ""
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try value.encode(to: encoder)
        try container.encodeIfPresent(YesNo(long), forKey: .long)
        try container.encodeIfPresent(approach, forKey: .approach)
        try container.encodeIfPresent(departure, forKey: .departure)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try PrintStyleTrillSound(from: decoder)
        long = try container.decodeIfPresent(Bool.self, forKey: .long)
        approach = try container.decodeIfPresent(AboveBelow.self, forKey: .approach)
        departure = try container.decodeIfPresent(AboveBelow.self, forKey: .departure)
    }
}

import XMLCoder
extension Mordent: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
