//
//  TextDecoration.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The text-decoration attribute group is based on the similar feature in XHTML and CSS. It allows
/// for text to be underlined, overlined, or struck-through. It extends the CSS version by allow
/// double or triple lines instead of just being on or off.
public struct TextDecoration {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let underline: Int?
    public let overline: Int?
    public let lineThrough: Int?

    // MARK: - Initializers

    public init(underline: Int? = nil, overline: Int? = nil, lineThrough: Int? = nil) {
        self.underline = underline
        self.overline = overline
        self.lineThrough = lineThrough
    }
}

extension TextDecoration: Equatable {}
extension TextDecoration: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case underline
        case overline
        case lineThrough = "line-through"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.underline = try container.decodeIfPresent(Int.self, forKey: .underline)
        self.overline = try container.decodeIfPresent(Int.self, forKey: .overline)
        self.lineThrough = try container.decodeIfPresent(Int.self, forKey: .lineThrough)
    }
}

extension TextDecoration.CodingKeys: XMLAttributeGroupCodingKey {}

import XMLCoder
extension TextDecoration: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.underline:
            return .attribute
        case CodingKeys.overline:
            return .attribute
        case CodingKeys.lineThrough:
            return .attribute
        default:
            return .element
        }
    }
}
