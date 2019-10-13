//
//  AccordionMiddle.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

public struct AccordionMiddle {
    public let value: Int
}

extension AccordionMiddle: Equatable {}
extension AccordionMiddle: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
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
        self.init(value: value)
    }
}
