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
    public let number: Int?
    public let additional: Bool?
    public let size: SymbolSize?
    public let afterBarline: Bool?
    public let printStyle: PrintStyle?
    public let printObject: Bool?
    public let sign: ClefSign
    public let line: Int?
    public let clefOctaveChange: Int?
}

extension Clef: Equatable { }
extension Clef: Decodable { }
