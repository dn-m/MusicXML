//
//  TupletDot.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tuplet-dot type is used to specify dotted normal tuplet types.
public struct TupletDot {
    public let font: Font
    public let color: Color?

    public init(font: Font = Font(), color: Color? = nil) {
        self.font = font
        self.color = color
    }
}

extension TupletDot: Equatable { }
extension TupletDot: Codable {
    enum CodingKeys: String, CodingKey {
        case color
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try font.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        font = try Font(from: decoder)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}
