//
//  Articulation.swift
//  MusicXML
//
//  Created by James Bean on 8/9/19.
//

import XMLCoder

/// Articulations and accents are grouped together here.
public enum Articulation {
    case accent(EmptyPlacement)
    case breathMark(BreathMark)
    case caesura(EmptyPlacement)
    case detachedLegato(EmptyPlacement)
    case doit(EmptyLine)
    case falloff(EmptyLine)
    case otherArticulation(PlacementText)
    case plop(EmptyLine)
    case scoop(EmptyLine)
    case spicatto(EmptyPlacement)
    case staccatissimo(EmptyPlacement)
    case staccato(EmptyPlacement)
    case stress(EmptyPlacement)
    case strongAccent(StrongAccent)
    case tenuto(EmptyPlacement)
    case unstress(EmptyPlacement)
}

extension Articulation: Equatable { }

extension Articulation: Codable {
    enum CodingKeys: String, CodingKey {
        case accent
        case breathMark
        case caesura
        case detachedLegato
        case doit
        case falloff
        case otherArticulation
        case plop
        case scoop
        case spicatto
        case staccatissimo
        case staccato
        case stress
        case strongAccent
        case tenuto
        case unstress
    }
    // sourcery:inline:Articulation.AutoXMLChoiceEncoding
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .accent(value):
            try container.encode(value, forKey: .accent)
        case let .breathMark(value):
            try container.encode(value, forKey: .breathMark)
        case let .caesura(value):
            try container.encode(value, forKey: .caesura)
        case let .detachedLegato(value):
            try container.encode(value, forKey: .detachedLegato)
        case let .doit(value):
            try container.encode(value, forKey: .doit)
        case let .falloff(value):
            try container.encode(value, forKey: .falloff)
        case let .otherArticulation(value):
            try container.encode(value, forKey: .otherArticulation)
        case let .plop(value):
            try container.encode(value, forKey: .plop)
        case let .scoop(value):
            try container.encode(value, forKey: .scoop)
        case let .spicatto(value):
            try container.encode(value, forKey: .spicatto)
        case let .staccatissimo(value):
            try container.encode(value, forKey: .staccatissimo)
        case let .staccato(value):
            try container.encode(value, forKey: .staccato)
        case let .stress(value):
            try container.encode(value, forKey: .stress)
        case let .strongAccent(value):
            try container.encode(value, forKey: .strongAccent)
        case let .tenuto(value):
            try container.encode(value, forKey: .tenuto)
        case let .unstress(value):
            try container.encode(value, forKey: .unstress)
        }
    }
    // sourcery:end
    // sourcery:inline:Articulation.AutoXMLChoiceDecoding
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.accent) {
            self = .accent(try decode(.accent))
        } else if container.contains(.breathMark) {
            self = .breathMark(try decode(.breathMark))
        } else if container.contains(.caesura) {
            self = .caesura(try decode(.caesura))
        } else if container.contains(.detachedLegato) {
            self = .detachedLegato(try decode(.detachedLegato))
        } else if container.contains(.doit) {
            self = .doit(try decode(.doit))
        } else if container.contains(.falloff) {
            self = .falloff(try decode(.falloff))
        } else if container.contains(.otherArticulation) {
            self = .otherArticulation(try decode(.otherArticulation))
        } else if container.contains(.plop) {
            self = .plop(try decode(.plop))
        } else if container.contains(.scoop) {
            self = .scoop(try decode(.scoop))
        } else if container.contains(.spicatto) {
            self = .spicatto(try decode(.spicatto))
        } else if container.contains(.staccatissimo) {
            self = .staccatissimo(try decode(.staccatissimo))
        } else if container.contains(.staccato) {
            self = .staccato(try decode(.staccato))
        } else if container.contains(.stress) {
            self = .stress(try decode(.stress))
        } else if container.contains(.strongAccent) {
            self = .strongAccent(try decode(.strongAccent))
        } else if container.contains(.tenuto) {
            self = .tenuto(try decode(.tenuto))
        } else if container.contains(.unstress) {
            self = .unstress(try decode(.unstress))
        } else {
            throw DecodingError.typeMismatch(
                Articulation.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
    // sourcery:end
}

extension Articulation.CodingKeys: XMLChoiceCodingKey { }
