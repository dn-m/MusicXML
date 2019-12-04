//
//  PerMinute.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The per-minute type can be a number, or a text description including numbers. If a font is
/// specified, it overrides the font specified for the overall metronome element. This allows
/// separate specification of a music font for the beat-unit and a text font for the numeric value,
/// in cases where a single metronome font is not used.
public struct PerMinute {
    // MARK: - Instance Properties

    // MARK: Attribute Groups

    public let font: Font

    // MARK: Value

    public let value: String

    // MARK: - Initializers

    public init(value: String, font: Font = Font()) {
        self.value = value
        self.font = font
    }
}

extension PerMinute: Equatable {}
extension PerMinute: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case value = ""
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try font.encode(to: encoder)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        font = try Font(from: decoder)
    }
}

import XMLCoder
extension PerMinute: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
