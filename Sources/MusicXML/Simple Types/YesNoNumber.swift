//
//  YesNoNumber.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

import XMLCoder

/// The yes-no-number type is used for attributes that can be either boolean or numeric values.
public enum YesNoNumber {
    case yesNo(YesNo)
    case number(Double)
}

extension YesNoNumber: Equatable {}
extension YesNoNumber: Codable {
    enum CodingKeys: CodingKey {}

    public func encode(to encoder: Encoder) throws {
        switch self {
        case let .yesNo(value):
            try value.encode(to: encoder)
        case let .number(value):
            try value.encode(to: encoder)
        }
    }

    public init(from decoder: Decoder) throws {
        do {
            self = .yesNo(try YesNo(from: decoder))
        } catch {
            self = .number(try Double(from: decoder))
        }
    }
}
