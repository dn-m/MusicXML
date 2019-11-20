//
//  EditorialVoice.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

// <!ENTITY % editorial-voice "(footnote?, level?, voice?)">
public struct EditorialVoice {
    public let footnote: FormattedText?
    public let level: Level?
    public let voice: Int?

    public init(footnote: FormattedText? = nil, level: Level? = nil, voice: Int? = nil) {
        self.footnote = footnote
        self.level = level
        self.voice = voice
    }
}

extension EditorialVoice: Equatable {}
extension EditorialVoice: Codable {}
