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
    
    public let cautionary: Bool?
    public let editorial: Bool?
    public let parentheses: Bool?
    public let bracket: Bool?
    public let size: SymbolSize?
    public let position: Position?
    public let printStyle: PrintStyle?

    // MARK: - Value

    public let value: AccidentalValue

    public init(cautionary: Bool? = nil, editorial: Bool? = nil, parentheses: Bool? = nil, bracket: Bool? = nil, size: SymbolSize? = nil, position: Position? = nil, printStyle: PrintStyle? = nil, value: AccidentalValue) {
        self.cautionary = cautionary
        self.editorial = editorial
        self.parentheses = parentheses
        self.bracket = bracket
        self.size = size
        self.position = position
        self.printStyle = printStyle
        self.value = value
    }
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
