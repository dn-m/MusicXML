//
//  NumberOrNormal.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

import XMLCoder

/// The number-or-normal values can be either a decimal number or the string "normal". This is used
/// by the line-height and letter-spacing attributes.
public enum NumberOrNormal {
    case number(Double)
    case normal
}

extension NumberOrNormal: Equatable { }

extension NumberOrNormal: Codable {
    enum CodingKeys: String, CodingKey { case number, normal }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .number(value):
            try container.encode(value, forKey: .number)
        case .normal:
            try container.encodeNil(forKey: .normal)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.number) {
            self = .number(try decode(.number))
        } else if container.contains(.normal) {
            _ = try container.decodeNil(forKey: .normal)
            self = .normal
        } else {
            throw DecodingError.typeMismatch(
                NumberOrNormal.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension NumberOrNormal.CodingKeys: XMLChoiceCodingKey {}
