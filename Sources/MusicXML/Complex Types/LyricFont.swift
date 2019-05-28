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
}

extension LyricFont: Equatable { }
extension LyricFont: Decodable { }
