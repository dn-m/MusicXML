//
//  LyricLanguage.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The lyric-language type specifies the default language for a particular name and number of lyric.
public struct LyricLanguage: Codable, Equatable {
    public let number: Int?
    public let name: String?
    public let language: String?
}
