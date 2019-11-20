//
//  Interchangeable.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The interchangeable type is used to represent the second in a pair of interchangeable dual time
/// signatures, such as the 6/8 in 3/4 (6/8).
public struct Interchangeable {
    public let symbol: TimeSymbol
    public let separator: TimeSeparator

    public init(symbol: TimeSymbol, separator: TimeSeparator) {
        self.symbol = symbol
        self.separator = separator
    }
}

extension Interchangeable: Equatable {}
extension Interchangeable: Codable {}
