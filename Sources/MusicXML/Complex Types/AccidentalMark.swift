//
//  AccidentalMark.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// An accidental-mark can be used as a separate notation or as part of an ornament. When used in an
/// ornament, position and placement are relative to the ornament, not relative to the note.
public struct AccidentalMark {
    public let value: AccidentalValue
    public let position: Position
    public let printStyle: PrintStyle
    public let placement: AboveBelow?
}

extension AccidentalMark: Equatable { }
extension AccidentalMark: Decodable { }
