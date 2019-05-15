//
//  EditorialVoice.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

// <!ENTITY % editorial-voice "(footnote?, level?, voice?)">
public struct EditorialVoice {
    public let footnote: Footnote?
    public let level: Level?
    public let voice: Voice?
}

extension EditorialVoice: Equatable { }
extension EditorialVoice: Decodable { }
