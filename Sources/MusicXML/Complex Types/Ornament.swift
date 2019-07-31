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
        case delayedInvertedTurn
        case delayedTurn
        case invertedMordent
        case invertedTurn
        case mordent
        case otherOrnament
        case shake
        case tremolo
        case trillMark
        case turn
        case verticalTurn
        case wavyLine
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

        do {
            self = .delayedInvertedTurn(try decode(.delayedInvertedTurn))
        } catch {
            do {
                self = .delayedTurn(try decode(.delayedTurn))
            } catch {
                do {
                    self = .invertedMordent(try decode(.invertedMordent))
                } catch {
                    do {
                        self = .invertedTurn(try decode(.invertedTurn))
                    } catch {
                        do {
                            self = .mordent(try decode(.mordent))
                        } catch {
                            do {
                                self = .otherOrnament(try decode(.otherOrnament))
                            } catch {
                                do {
                                    self = .shake(try decode(.shake))
                                } catch {
                                    do {
                                        self = .tremolo(try decode(.tremolo))
                                    } catch {
                                        do {
                                            self = .trillMark(try decode(.trillMark))
                                        } catch {
                                            do {
                                                self = .turn(try decode(.turn))
                                            } catch {
                                                do {
                                                    self = .verticalTurn(try decode(.verticalTurn))
                                                } catch {
                                                    self = .wavyLine(try decode(.wavyLine))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension Ornament.CodingKeys: XMLChoiceCodingKey { }
