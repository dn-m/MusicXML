//
//  LyricLanguage.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The lyric-language type specifies the default language for a particular name and number of lyric.
public struct LyricLanguage: Codable, Equatable {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let number: Int?
    public let name: String?
    public let language: String?

    // MARK: - Initializers

    public init(number: Int? = nil, name: String? = nil, language: String? = nil) {
        self.number = number
        self.name = name
        self.language = language
    }
}

import XMLCoder
// sourcery:inline:LyricLanguage: Codable, Equatable.DynamicNodeEncoding
// sourcery:end
