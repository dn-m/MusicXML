//
//  Forward.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

// <!ELEMENT forward
//    (duration, %editorial-voice;, staff?)>
public struct Forward {
    public let duration: Int
    public let editorialVoice: EditorialVoice?
    public let staff: Int?
}

extension Forward: Equatable { }
extension Forward: Decodable { }
