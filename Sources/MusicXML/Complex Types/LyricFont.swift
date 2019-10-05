//
//  LyricFont.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The lyric-font type specifies the default font for a particular name and number of lyric.
public struct LyricFont {
    public let number: Int?
    public let name: String?
    public let font: Font

    public init(number: Int? = nil, name: String? = nil, font: Font) {
        self.number = number
        self.name = name
        self.font = font
    }
}

extension LyricFont: Equatable { }
extension LyricFont: Codable { }
