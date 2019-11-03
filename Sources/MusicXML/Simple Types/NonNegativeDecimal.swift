//
//  NonNegativeDecimal.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

public struct NonNegativeDecimal {
    public let value: Double
}

extension NonNegativeDecimal: Equatable { }
extension NonNegativeDecimal: Codable {
    // sourcery:inline:NonNegativeDecimal.ExplicitCodingKey
    enum CodingKeys: String, CodingKey {
        case value = ""
    }
    // sourcery:end
}
