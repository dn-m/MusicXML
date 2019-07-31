//
//  Accidental.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The accidental type represents actual notated accidentals. Editorial and cautionary indications
/// are indicated by attributes. Values for these attributes are "no" if not present. Specific
/// graphic display such as parentheses, brackets, and size are controlled by the level-display
/// attribute group.
public struct Accidental {
    public let value: AccidentalValue
    public let cautionary: Bool?
    public let editorial: Bool?
    public let parentheses: Bool?
    public let bracket: Bool?
    public let size: SymbolSize?
    public let position: Position?
    public let printStyle: PrintStyle?
}

extension Accidental: Equatable { }
extension Accidental: Codable { }
