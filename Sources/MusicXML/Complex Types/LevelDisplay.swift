//
//  LevelDisplay.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The level-display attribute group specifies three common ways to indicate editorial indications:
/// putting parentheses or square brackets around a symbol, or making the symbol a different size.
/// If not specified, they are left to application defaults. It is used by the level and accidental
/// elements.
public struct LevelDisplay {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let parentheses: Bool?
    public let bracket: Bool?
    public let size: SymbolSize?

    // MARK: - Initializers

    public init(parentheses: Bool, bracket: Bool, size: SymbolSize) {
        self.parentheses = parentheses
        self.bracket = bracket
        self.size = size
    }
}

extension LevelDisplay: Equatable {}
extension LevelDisplay: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case parentheses
        case bracket
        case size = "symbol-size"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses)
        self.bracket = try container.decodeIfPresent(Bool.self, forKey: .bracket)
        self.size = try container.decodeIfPresent(SymbolSize.self, forKey: .size)
    }
}

extension LevelDisplay.CodingKeys: XMLAttributeGroupCodingKey {}

import XMLCoder
extension LevelDisplay: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.parentheses:
            return .attribute
        case CodingKeys.bracket:
            return .attribute
        case CodingKeys.size:
            return .attribute
        default:
        return .element
        }
    }
}
