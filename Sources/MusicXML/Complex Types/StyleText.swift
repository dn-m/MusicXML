//
//  StyleText.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The style-text type represents a text element with a print-style attribute group.
public struct StyleText {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: String

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: - Initializers

    public init(_ value: String, printStyle: PrintStyle = PrintStyle()) {
        self.value = value
        self.printStyle = printStyle
    }
}

extension StyleText: Equatable {}
extension StyleText: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case value = ""
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        // Decode attribute group
        self.printStyle = try PrintStyle(from: decoder)
        // Decode value
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(String.self, forKey: .value)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try printStyle.encode(to: encoder)
        try container.encode(value, forKey: .value)
    }
}

extension StyleText: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }
}

import XMLCoder
extension StyleText: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
