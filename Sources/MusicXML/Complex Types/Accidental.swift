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

    // MARK: - Attributes
    
    public var cautionary: Bool?
    public var editorial: Bool?
    public var parentheses: Bool?
    public var bracket: Bool?
    public var size: SymbolSize?
    public var position: Position?
    public var printStyle: PrintStyle?

    // MARK: - Value

    public var value: AccidentalValue
}

extension Accidental: Equatable { }
extension Accidental: Codable {
    enum CodingKeys: String, CodingKey {
        case cautionary
        case editorial
        case parentheses
        case bracket
        case size
        case position
        case printStyle
        case value = ""
    }
}
