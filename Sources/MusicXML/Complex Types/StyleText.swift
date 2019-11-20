//
//  StyleText.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The style-text type represents a text element with a print-style attribute group.
public struct StyleText {
    public let value: String
    public let printStyle: PrintStyle

    public init(_ value: String, printStyle: PrintStyle = PrintStyle()) {
        self.value = value
        self.printStyle = printStyle
    }
}

extension StyleText: Equatable {}
extension StyleText: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
    }

    public init(from decoder: Decoder) throws {
        // Decode attribute group
        self.printStyle = try PrintStyle(from: decoder)
        // Decode value
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(String.self, forKey: .value)
    }

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
