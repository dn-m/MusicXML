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

extension FontSize: Equatable { }

extension FontSize: Codable {
    enum CodingKeys: String, CodingKey { case css, numeric }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .css(try container.decode(CSSFontSize.self, forKey: .css))
        } catch {
            self = .numeric(try container.decode(Double.self, forKey: .numeric))
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = try encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .css(size):
            try container.encode(size, forKey: .css)
        case let .numeric(size):
            try container.encode(size, forKey: .numeric)
        }
    }
}

extension FontSize.CodingKeys: XMLChoiceCodingKey {}
