//
//  FontSize.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

import XMLCoder

/// The font-size can be one of the CSS font sizes or a numeric point size.
public enum FontSize {
    case css(CSSFontSize)
    case numeric(Double)
}

extension FontSize {

    // MARK: - Initializers

    public init(_ numeric: Double) {
        self = .numeric(numeric)
    }

    public init(_ css: CSSFontSize) {
        self = .css(css)
    }
}

extension FontSize: Equatable { }

extension FontSize: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Double.self) {
            self.init(value)
        } else if let value = try? container.decode(CSSFontSize.self) {
            self.init(value)
        } else {
            throw DecodingError.typeMismatch(
                FontSize.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Invalid type for FontSize"
                )
            )
        }
    }
    public func encode(to encoder: Encoder) throws {
        switch self {
        case let .css(size):
            try size.encode(to: encoder)
        case let .numeric(size):
            try size.encode(to: encoder)
        }
    }
}

extension FontSize: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Double) {
        self.init(value)
    }
}

extension FontSize: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.init(value)
    }
}
