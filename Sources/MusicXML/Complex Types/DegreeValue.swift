//
//  DegreeValue.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The content of the degree-value type is a number indicating the degree of the chord (1 for the
/// root, 3 for third, etc). The text attribute specifies how the type of the degree should be
/// displayed in a score. The degree-value symbol attribute indicates that a symbol should be used
/// in specifying the degree. If the symbol attribute is present, the value of the text attribute
/// follows the symbol.
public struct DegreeValue {
    public let value: Int
    public let symbol: DegreeSymbolValue?
    public let text: String?
    public let printStyle: PrintStyle

    public init(
        _ value: Int,
        symbol: DegreeSymbolValue? = nil,
        text: String? = nil,
        printStyle: PrintStyle = PrintStyle()
    ) {
        self.value = value
        self.symbol = symbol
        self.text = text
        self.printStyle = printStyle
    }
}

extension DegreeValue: Equatable {}
extension DegreeValue: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case symbol
        case text
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(Int.self, forKey: .value)
        self.symbol = try container.decodeIfPresent(DegreeSymbolValue.self, forKey: .symbol)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.printStyle = try PrintStyle(from: decoder)
    }
}

extension DegreeValue: ExpressibleByIntegerLiteral {
    // MARK: - ExpressibleByIntegerLiteral

    public init(integerLiteral value: Int) {
        self.init(value)
    }
}
