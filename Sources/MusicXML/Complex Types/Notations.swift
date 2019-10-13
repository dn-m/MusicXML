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

    public init(printObject: Bool? = nil, footnote: FormattedText? = nil, level: Level? = nil, values: [Notation]) {
        self.printObject = printObject
        self.footnote = footnote
        self.level = level
        self.values = values
    }
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
        case nonArpeggiate = "non-arpeggiate"
        case accidentalMark = "accidental-mark"
        case other
    }
    // sourcery:inline:Notations.Notation.AutoXMLChoiceEncoding
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
    // sourcery:end
    // sourcery:inline:Notations.Notation.AutoXMLChoiceDecoding
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.tied) {
            self = .tied(try decode(.tied))
        } else if container.contains(.slur) {
            self = .slur(try decode(.slur))
        } else if container.contains(.tuplet) {
            self = .tuplet(try decode(.tuplet))
        } else if container.contains(.glissando) {
            self = .glissando(try decode(.glissando))
        } else if container.contains(.slide) {
            self = .slide(try decode(.slide))
        } else if container.contains(.ornaments) {
            self = .ornaments(try decode(.ornaments))
        } else if container.contains(.technical) {
            self = .technical(try decode(.technical))
        } else if container.contains(.articulations) {
            self = .articulations(try decode(.articulations))
        } else if container.contains(.dynamics) {
            self = .dynamics(try decode(.dynamics))
        } else if container.contains(.fermata) {
            self = .fermata(try decode(.fermata))
        } else if container.contains(.arpeggiate) {
            self = .arpeggiate(try decode(.arpeggiate))
        } else if container.contains(.nonArpeggiate) {
            self = .nonArpeggiate(try decode(.nonArpeggiate))
        } else if container.contains(.accidentalMark) {
            self = .accidentalMark(try decode(.accidentalMark))
        } else if container.contains(.other) {
            self = .other(try decode(.other))
        } else {
            throw DecodingError.typeMismatch(
                Notations.Notation.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
    // sourcery:end
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
