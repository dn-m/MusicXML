//
//  TupletType.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tuplet-type type indicates the graphical note type of the notes for this portion of the
/// tuplet.
public struct TupletType {
    public let value: NoteTypeValue
    public let font: Font
    public let color: Color?

    public init(_ value: NoteTypeValue, font: Font = Font(), color: Color? = nil) {
        self.value = value
        self.font = font
        self.color = color
    }
}

extension TupletType: Equatable {}
extension TupletType: Codable {
    enum CodingKeys: String, CodingKey {
        case color
        case value = ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try font.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(NoteTypeValue.self, forKey: .value)
        font = try Font(from: decoder)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}
