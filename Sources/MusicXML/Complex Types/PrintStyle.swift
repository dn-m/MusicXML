//
//  PrintStyle.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The print-style attribute group collects the most popular combination of printing attributes:
/// position, font, and color.
public struct PrintStyle {
    public let position: Position
    public let font: Font
    public let color: Color?

    public init(position: Position = Position(), font: Font = Font(), color: Color? = nil) {
        self.position = position
        self.font = font
        self.color = color
    }
}

extension PrintStyle: Equatable { }
extension PrintStyle: Codable {
    private enum CodingKeys: String, CodingKey {
        case color
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.position = try Position(from: decoder)
        self.font = try Font(from: decoder)
        self.color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}
