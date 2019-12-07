//
//  PrintStyleAlign.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-print-style-align type represents an empty element with print-style-align attribute
/// group.
public struct PrintStyleAlign {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: - Initializers

    public init(printStyle: PrintStyle = PrintStyle(), hAlign: LeftCenterRight? = nil, vAlign: VAlign? = nil) {
        self.printStyle = printStyle
        self.hAlign = hAlign
        self.vAlign = vAlign
    }
}

extension PrintStyleAlign: Equatable {}
extension PrintStyleAlign: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case hAlign = "halign"
        case vAlign = "valign"
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(hAlign, forKey: .hAlign)
        try container.encodeIfPresent(vAlign, forKey: .vAlign)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
        self.vAlign = try container.decodeIfPresent(VAlign.self, forKey: .vAlign)
        self.printStyle = try PrintStyle(from: decoder)
    }
}

extension PrintStyleAlign.CodingKeys: XMLAttributeGroupCodingKey {}

import XMLCoder
extension PrintStyleAlign: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.hAlign:
            return .attribute
        case CodingKeys.vAlign:
            return .attribute
        default:
            return .element
        }
    }
}
