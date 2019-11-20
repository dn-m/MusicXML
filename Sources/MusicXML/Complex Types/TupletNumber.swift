//
//  TupletNumber.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tuplet-number type indicates the number of notes for this portion of the tuplet.
public struct TupletNumber {
    public let value: Int
    public let font: Font
    public let color: Color?

    public init(_ value: Int, font: Font = Font(), color: Color? = nil) {
        self.value = value
        self.font = font
        self.color = color
    }
}

extension TupletNumber: Equatable {}
extension TupletNumber: Codable {
    enum CodingKeys: String, CodingKey {
        case color
        case value = ""
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(Int.self, forKey: .value)
        font = try Font(from: decoder)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try font.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
    }
}
