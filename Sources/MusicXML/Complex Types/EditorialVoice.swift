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
}

extension EditorialVoice: Equatable { }
extension EditorialVoice: Decodable { }
