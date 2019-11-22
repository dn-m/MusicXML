//
//  Tenths.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

public struct Tenths {
    public let value: Double
}

extension Tenths: Equatable {}
extension Tenths: Hashable {}

extension Tenths: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
    }

    public func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        value = try container.decode(Double.self)
    }
}

extension Tenths: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.value = value
    }
}

extension Tenths: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.value = Double(value)
    }
}
