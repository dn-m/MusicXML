//
//  Handbell.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The handbell element represents notation for various techniques used in handbell and handchime
/// music.
public struct Handbell {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let placement: AboveBelow?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: Value

    public let value: HandbellValue

    // MARK: - Initializers

    public init(_ value: HandbellValue, printStyle: PrintStyle = PrintStyle(), placement: AboveBelow? = nil) {
        self.value = value
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension Handbell: Equatable {}
extension Handbell: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case placement
        case value = ""
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(HandbellValue.self, forKey: .value)
        printStyle = try PrintStyle(from: decoder)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(placement, forKey: .placement)
    }
}

import XMLCoder
extension Handbell: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
