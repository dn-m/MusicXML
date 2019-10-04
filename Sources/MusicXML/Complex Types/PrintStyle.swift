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
    public let color: Color

    public init(position: Position, font: Font, color: Color) {
        self.position = position
        self.font = font
        self.color = color
    }
}

extension PrintStyle: Equatable { }
extension PrintStyle: Codable { }
