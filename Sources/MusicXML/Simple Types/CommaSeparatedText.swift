//
//  CommaSeparatedText.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The comma-separated-text type is used to specify a comma-separated list of text elements, as is
/// used by the font-family attribute.
public struct CommaSeparatedText {
    let values: [String]
}

extension CommaSeparatedText: Equatable {}
extension CommaSeparatedText: Codable {}

extension CommaSeparatedText: ExpressibleByArrayLiteral {
    public init(arrayLiteral values: String...) {
        self.values = values
    }
}

extension CommaSeparatedText: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.values = [value]
    }
}
