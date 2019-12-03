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
    // MARK: - Instance Properties

    // MARK: Value

    public let value: AccidentalValue

    // MARK: Attributes

    public let cautionary: Bool?
    public let editorial: Bool?
    public let parentheses: Bool?
    public let bracket: Bool?
    public let size: SymbolSize?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK - Initializers

    public init(
        _ value: AccidentalValue,
        cautionary: Bool? = nil,
        editorial: Bool? = nil,
        parentheses: Bool? = nil,
        bracket: Bool? = nil,
        size: SymbolSize? = nil,
        printStyle: PrintStyle = PrintStyle()
    ) {
        self.value = value
        self.cautionary = cautionary
        self.editorial = editorial
        self.parentheses = parentheses
        self.bracket = bracket
        self.size = size
        self.printStyle = printStyle
    }
}

extension Accidental {
    // MARK: - Type Properties

    public static let sharp = Accidental(.sharp)
    public static let natural = Accidental(.natural)
    public static let flat = Accidental(.flat)
    public static let doubleSharp = Accidental(.doubleSharp)
    public static let sharpSharp = Accidental(.sharpSharp)
    public static let flatFlat = Accidental(.flatFlat)
    public static let doubleFlat = Accidental(.doubleFlat)
    public static let naturalSharp = Accidental(.naturalSharp)
    public static let naturalFlat = Accidental(.naturalFlat)
    public static let quarterFlat = Accidental(.quarterFlat)
    public static let quarterSharp = Accidental(.quarterSharp)
    public static let threeQuartersFlat = Accidental(.threeQuartersFlat)
    public static let threeQuartersSharp = Accidental(.threeQuartersSharp)
    public static let sharpDown = Accidental(.sharpDown)
    public static let sharpUp = Accidental(.sharpUp)
    public static let naturalDown = Accidental(.naturalDown)
    public static let naturalUp = Accidental(.naturalUp)
    public static let flatDown = Accidental(.flatDown)
    public static let flatUp = Accidental(.flatUp)
    public static let doubleSharpDown = Accidental(.doubleSharpDown)
    public static let doubleSharpUp = Accidental(.doubleSharpUp)
    public static let flatFlatDown = Accidental(.flatFlatDown)
    public static let flatFlatUp = Accidental(.flatFlatUp)
    public static let arrowDown = Accidental(.arrowDown)
    public static let arrowUp = Accidental(.arrowUp)
    public static let tripleSharp = Accidental(.tripleSharp)
    public static let tripleFlat = Accidental(.tripleFlat)
    public static let slashQuarterSharp = Accidental(.slashQuarterSharp)
    public static let slashSharp = Accidental(.slashSharp)
    public static let slashFlat = Accidental(.slashFlat)
    public static let doubleSlashFlat = Accidental(.doubleSlashFlat)
    public static let sharp1 = Accidental(.sharp1)
    public static let sharp2 = Accidental(.sharp2)
    public static let sharp3 = Accidental(.sharp3)
    public static let sharp5 = Accidental(.sharp5)
    public static let flat1 = Accidental(.flat1)
    public static let flat2 = Accidental(.flat2)
    public static let flat3 = Accidental(.flat3)
    public static let flat4 = Accidental(.flat4)
    public static let sori = Accidental(.sori)
    public static let koron = Accidental(.koron)
    public static let other = Accidental(.other)
}

extension Accidental: Equatable {}
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

    // MARK - Decodable

    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.printStyle = try PrintStyle(from: decoder)
        // Decode attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cautionary = try container.decodeIfPresent(Bool.self, forKey: .cautionary)
        self.editorial = try container.decodeIfPresent(Bool.self, forKey: .editorial)
        self.parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses)
        self.bracket = try container.decodeIfPresent(Bool.self, forKey: .bracket)
        self.size = try container.decodeIfPresent(SymbolSize.self, forKey: .size)
        // Decode value
        self.value = try container.decode(AccidentalValue.self, forKey: .value)
    }

    // sourcery:inline:Accidental.AutoEncodable
    // MARK - Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encodeIfPresent(YesNo(cautionary), forKey: .cautionary)
        try container.encodeIfPresent(YesNo(editorial), forKey: .editorial)
        try container.encodeIfPresent(YesNo(parentheses), forKey: .parentheses)
        try container.encodeIfPresent(YesNo(bracket), forKey: .bracket)
        try container.encodeIfPresent(size, forKey: .size)
        try printStyle.encode(to: encoder)
    }
    // sourcery:end
}

import XMLCoder
extension Accidental: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
