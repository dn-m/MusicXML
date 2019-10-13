//
//  Ornament.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

import XMLCoder

public enum Ornament {
    case delayedInvertedTurn(HorizontalTurn)
    case delayedTurn(HorizontalTurn)
    case invertedMordent(Mordent)
    case invertedTurn(HorizontalTurn)
    case mordent(Mordent)
    case otherOrnament(PlacementText)
    case shake(EmptyTrillSound)
    case tremolo(Tremolo)
    case trillMark(EmptyTrillSound)
    case turn(HorizontalTurn)
    case verticalTurn(EmptyTrillSound)
    case wavyLine(WavyLine)
}

extension Ornament: Equatable { }
extension Ornament: Codable {
    enum CodingKeys: String, CodingKey {
        case delayedInvertedTurn = "delayed-inverted-turn"
        case delayedTurn = "delayed-turn"
        case invertedMordent = "inverted-mordent"
        case invertedTurn = "inverted-turn"
        case mordent
        case otherOrnament = "other-ornament"
        case shake
        case tremolo
        case trillMark = "trill-mark"
        case turn
        case verticalTurn = "vertical-turn"
        case wavyLine = "wavy-line"
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .delayedInvertedTurn(value):
            try container.encode(value, forKey: .delayedInvertedTurn)
        case let .delayedTurn(value):
            try container.encode(value, forKey: .delayedTurn)
        case let .invertedMordent(value):
            try container.encode(value, forKey: .invertedMordent)
        case let .invertedTurn(value):
            try container.encode(value, forKey: .invertedTurn)
        case let .mordent(value):
            try container.encode(value, forKey: .mordent)
        case let .otherOrnament(value):
            try container.encode(value, forKey: .otherOrnament)
        case let .shake(value):
            try container.encode(value, forKey: .shake)
        case let .tremolo(value):
            try container.encode(value, forKey: .tremolo)
        case let .trillMark(value):
            try container.encode(value, forKey: .trillMark)
        case let .turn(value):
            try container.encode(value, forKey: .turn)
        case let .verticalTurn(value):
            try container.encode(value, forKey: .verticalTurn)
        case let .wavyLine(value):
            try container.encode(value, forKey: .wavyLine)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.delayedInvertedTurn) {
            self = .delayedInvertedTurn(try decode(.delayedInvertedTurn))
        } else if container.contains(.delayedTurn) {
            self = .delayedTurn(try decode(.delayedTurn))
        } else if container.contains(.invertedMordent) {
            self = .invertedMordent(try decode(.invertedMordent))
        } else if container.contains(.invertedTurn) {
            self = .invertedTurn(try decode(.invertedTurn))
        } else if container.contains(.mordent) {
            self = .mordent(try decode(.mordent))
        } else if container.contains(.otherOrnament) {
            self = .otherOrnament(try decode(.otherOrnament))
        } else if container.contains(.shake) {
            self = .shake(try decode(.shake))
        } else if container.contains(.tremolo) {
            self = .tremolo(try decode(.tremolo))
        } else if container.contains(.trillMark) {
            self = .trillMark(try decode(.trillMark))
        } else if container.contains(.turn) {
            self = .turn(try decode(.turn))
        } else if container.contains(.verticalTurn) {
            self = .verticalTurn(try decode(.verticalTurn))
        } else if container.contains(.wavyLine) {
            self = .wavyLine(try decode(.wavyLine))
        } else {
            throw DecodingError.typeMismatch(
                Ornament.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension Ornament.CodingKeys: XMLChoiceCodingKey { }
