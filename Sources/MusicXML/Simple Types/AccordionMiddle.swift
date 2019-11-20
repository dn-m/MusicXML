//
//  AccordionMiddle.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

public struct AccordionMiddle {
    public let value: Int

    public init(_ value: Int) {
        self.value = value
    }
}

extension AccordionMiddle: Equatable {}
extension AccordionMiddle: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
    }

    public func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self.value = try container.decode(Int.self)
        } catch {
            self.value = 1
        }
    }
}

extension AccordionMiddle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}
