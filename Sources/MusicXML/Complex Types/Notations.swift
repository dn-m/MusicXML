//
//  Notations.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

import XMLCoder

/// Notations refer to musical notations, not XML notations. Multiple notations are allowed in order
/// to represent multiple editorial levels. The print-object attribute, added in Version 3.0, allows
/// notations to represent details of performance technique, such as fingerings, without having them
/// appear in the score.
public struct Notations {

    // MARK: - Attributes

    public var printObject: Bool?

    // MARK: - Elements

    public var footnote: FormattedText?
    public var level: Level?
    public var values: [Notation]
}

extension Notations {
    public enum Notation {
        case tied(Tied)
        case slur(Slur)
        case tuplet(Tuplet)
        case glissando(Glissando)
        case slide(Slide)
        case ornaments(Ornaments)
        case technical(Technical)
        case articulations(Articulations)
        case dynamics(Dynamics)
        case fermata(Fermata)
        case arpeggiate(Arpeggiate)
        case nonArpeggiate(NonArpeggiate)
        case accidentalMark(AccidentalMark)
        case other(OtherNotation)
    }
}

extension Notations.Notation: Equatable { }
extension Notations.Notation: Codable {
    enum CodingKeys: String, CodingKey {
        case tied
        case slur
        case tuplet
        case glissando
        case slide
        case ornaments
        case technical
        case articulations
        case dynamics
        case fermata
        case arpeggiate
        case nonArpeggiate
        case accidentalMark
        case other
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .tied(value):
            try container.encode(value, forKey: .tied)
        case let .slur(value):
            try container.encode(value, forKey: .slur)
        case let .tuplet(value):
            try container.encode(value, forKey: .tuplet)
        case let .glissando(value):
            try container.encode(value, forKey: .glissando)
        case let .slide(value):
            try container.encode(value, forKey: .slide)
        case let .ornaments(value):
            try container.encode(value, forKey: .ornaments)
        case let .technical(value):
            try container.encode(value, forKey: .technical)
        case let .articulations(value):
            try container.encode(value, forKey: .articulations)
        case let .dynamics(value):
            try container.encode(value, forKey: .dynamics)
        case let .fermata(value):
            try container.encode(value, forKey: .fermata)
        case let .arpeggiate(value):
            try container.encode(value, forKey: .arpeggiate)
        case let .nonArpeggiate(value):
            try container.encode(value, forKey: .nonArpeggiate)
        case let .accidentalMark(value):
            try container.encode(value, forKey: .accidentalMark)
        case let .other(value):
            try container.encode(value, forKey: .other)
        }
    }

    // FIXME: Use `if let value = try?` instead of pyramid of doom
    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        do {
            self = .tied(try decode(.tied))
        } catch {
            do {
                self = .slur(try decode(.slur))
            } catch {
                do {
                    self = .tuplet(try decode(.tuplet))
                } catch {
                    do {
                        self = .glissando(try decode(.glissando))
                    } catch {
                        do {
                            self = .slide(try decode(.slide))
                        } catch {
                            do {
                                self = .ornaments(try decode(.ornaments))
                            } catch {
                                do {
                                    self = .technical(try decode(.technical))
                                } catch {
                                    do {
                                        self = .articulations(try decode(.articulations))
                                    } catch {
                                        do {
                                            self = .dynamics(try decode(.dynamics))
                                        } catch {
                                            do {
                                                self = .fermata(try decode(.fermata))
                                            } catch {
                                                do {
                                                    self = .arpeggiate(try decode(.arpeggiate))
                                                } catch {
                                                    do {
                                                        self = .nonArpeggiate(try decode(.nonArpeggiate))
                                                    } catch {
                                                        do {
                                                            self = .accidentalMark(try decode(.accidentalMark))
                                                        } catch {
                                                            self = .other(try decode(.other))
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
    }
}

extension Notations.Notation.CodingKeys: XMLChoiceCodingKey { }

extension Notations: Equatable { }
extension Notations: Codable {
    public init(from decoder: Decoder) throws {
        // Decode values
        let valuesContainer = try decoder.singleValueContainer()
        self.values = try valuesContainer.decode([Notation].self)
        // Decode attribtues
        let attributesContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.footnote = try attributesContainer.decodeIfPresent(FormattedText.self, forKey: .footnote)
        self.level = try attributesContainer.decodeIfPresent(Level.self, forKey: .level)
        self.printObject = try attributesContainer.decodeIfPresent(Bool.self, forKey: .printObject)
    }
}
