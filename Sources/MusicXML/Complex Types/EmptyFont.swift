//
//  EmptyFont.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-font type represents an empty element with font attributes.
public struct EmptyFont {
    public let font: Font

    public init(_ font: Font) {
        self.font = font
    }
}

extension EmptyFont: Equatable { }
extension EmptyFont: Codable { }
