//
//  Notehead.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The notehead element indicates shapes other than the open and closed ovals associated with note
/// durations. For the enclosed shapes, the default is to be hollow for half notes and longer, and
/// filled otherwise. The filled attribute can be set to change this if needed.
public struct Notehead {
    public let value: NoteheadValue
    public let filled: Bool
    public let parentheses: Bool
    public let font: Font
    public let color: Color
}

extension Notehead: Equatable { }
extension Notehead: Decodable { }
