//
//  PitchUnpitchedRest.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XMLCoder

public enum PitchUnpitchedOrRest {
    case pitch(Pitch)
    case unpitched(Unpitched)
    case rest(Rest)
}

extension PitchUnpitchedOrRest: Equatable {}

extension PitchUnpitchedOrRest: Codable {
    enum CodingKeys: String, CodingKey {
        case pitch
        case unpitched
        case rest
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .pitch(value):
            try container.encode(value, forKey: .pitch)
        case let .unpitched(value):
            try container.encode(value, forKey: .unpitched)
        case let .rest(value):
            try container.encode(value, forKey: .rest)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.pitch) {
            self = .pitch(try decode(.pitch))
        } else if container.contains(.unpitched) {
            self = .unpitched(try decode(.unpitched))
        } else if container.contains(.rest) {
            self = .rest(try decode(.rest))
        } else {
            throw DecodingError.typeMismatch(
                PitchUnpitchedOrRest.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension PitchUnpitchedOrRest.CodingKeys: XMLChoiceCodingKey {}
