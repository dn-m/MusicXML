//
//  Interchangeable.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The interchangeable type is used to represent the second in a pair of interchangeable dual time
/// signatures, such as the 6/8 in 3/4 (6/8).
public struct Interchangeable {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let symbol: TimeSymbol
    public let separator: TimeSeparator

    // FIXME: Add Elements

    // MARK: - Initializers

    public init(symbol: TimeSymbol, separator: TimeSeparator) {
        self.symbol = symbol
        self.separator = separator
    }
}

extension Interchangeable: Equatable {}
extension Interchangeable: Codable {}

import XMLCoder
extension Interchangeable: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.symbol, CodingKeys.separator:
            return .attribute
        default:
            return .element
        }
    }
}
