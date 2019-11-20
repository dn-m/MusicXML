//
//  YesNoNumber.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

import XMLCoder

/// The yes-no-number type is used for attributes that can be either boolean or numeric values.
public enum YesNoNumber {
    case yes
    case no
    case number(Double)
}

extension YesNoNumber: Equatable {}
extension YesNoNumber: Codable {
    enum CodingKeys: String, CodingKey { case yes, no, number }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .yes:
            try container.encodeNil(forKey: .yes)
        case .no:
            try container.encodeNil(forKey: .no)
        case let .number(value):
            try container.encode(value, forKey: .number)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.yes) {
            _ = try container.decodeNil(forKey: .yes)
            self = .yes
        } else if container.contains(.no) {
            _ = try container.decodeNil(forKey: .no)
            self = .no
        } else if container.contains(.number) {
            self = .number(try decode(.number))
        } else {
            throw DecodingError.typeMismatch(
                YesNoNumber.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension YesNoNumber.CodingKeys: XMLChoiceCodingKey {}
