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
    public let defaultX: Tenths?
    public let defaultY: Tenths?
    public let relativeX: Tenths?
    public let relativeY: Tenths?
    public let fontFamily: CommaSeparatedText?
    public let fontStyle: FontSize?
    public let fontSize: FontSize?
    public let fontWeight: FontWeight?
    public let color: Color?
}

extension Accidental: Equatable { }
extension Accidental: Decodable { }

//extension Accidental {
//
//    // MARK: Initializers
//
//    public init(
//        _ value: AccidentalValue,
//        parentheses: Bool = false,
//        bracket: Bool = false,
//        cautionary: Bool = false,
//        editorial: Bool = false
//    )
//    {
//        self.value = value
//        self.parentheses = parentheses
//        self.bracket = bracket
//        self.cautionary = cautionary
//        self.editorial = editorial
//    }
//}
//
//extension Accidental: Equatable { }
//
//extension Accidental: Decodable {
//    enum CodingKeys: String, CodingKey {
//        case editorial
//        case cautionary
//        case parentheses
//        case bracket
//        case value
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.value = try container.decode(AccidentalValue.self, forKey: .value)
//        self.parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses) ?? false
//        self.bracket = try container.decodeIfPresent(Bool.self, forKey: .bracket) ?? false
//        self.cautionary = try container.decodeIfPresent(Bool.self, forKey: .cautionary) ?? false
//        self.editorial = try container.decodeIfPresent(Bool.self, forKey: .editorial) ?? false
//    }
//}
//
//import XMLCoder
//
//extension Accidental: DynamicNodeDecoding {
//
//    /// - Returns: The proper `XMLDecoder.NodeDecoding` for the given `key`.
//    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
//        switch key {
//        case Accidental.CodingKeys.value:
//            return .element
//        default:
//            return .attribute
//        }
//    }
//}
