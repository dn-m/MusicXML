//
//  DashedFormatting.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The dashed-formatting entity represents the length of dashes and spaces in a dashed line. Both
/// the dash-length and space-length attributes are represented in tenths. These attributes are
/// ignored if the corresponding line-type attribute is not dashed.
public struct DashedFormatting {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let dashLength: Tenths?
    public let spaceLength: Tenths?

    // MARK: - Initializers

    public init(dashLength: Tenths? = nil, spaceLength: Tenths? = nil) {
        self.dashLength = dashLength
        self.spaceLength = spaceLength
    }
}

extension DashedFormatting: Equatable {}
extension DashedFormatting: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case dashLength = "dash-length"
        case spaceLength = "space-length"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dashLength = try container.decodeIfPresent(Tenths.self, forKey: .dashLength)
        self.spaceLength = try container.decodeIfPresent(Tenths.self, forKey: .spaceLength)
    }
}

extension DashedFormatting.CodingKeys: XMLAttributeGroupCodingKey {}

import XMLCoder
extension DashedFormatting: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.dashLength, CodingKeys.spaceLength:
            return .attribute
        default:
            return .element
        }
    }
}
