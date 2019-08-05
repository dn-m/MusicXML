//
//  Clef.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// Clefs are represented by a combination of sign, line, and clef-octave-change elements. Clefs
/// appear at the start of each system unless the print-object attribute has been set to "no" or the
/// additional attribute has been set to "yes".
public struct Clef {
    public var number: Int?
    public var additional: Bool?
    public var size: SymbolSize?
    public var afterBarline: Bool?
    public var printStyle: PrintStyle?
    public var printObject: Bool?
    public var sign: ClefSign
    public var line: Int?
    public var clefOctaveChange: Int?
}

extension Clef: Equatable { }
extension Clef: Codable { }
