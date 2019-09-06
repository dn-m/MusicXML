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
        case detatchedLegato
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
            try container.encode(value, forKey: .detatchedLegato)
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

    public init(from decoder: Decoder) throws {

        enum DecodingError: Error {
            case unknownKind
        }

        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? container.decode(EmptyPlacement.self, forKey: .accent) {
            self = .accent(value)
        } else if let value = try? container.decode(BreathMark.self, forKey: .breathMark) {
            self = .breathMark(value)
        } else if let value = try? container.decode(EmptyPlacement.self, forKey: .caesura) {
            self = .caesura(value)
        } else if let value = try? container.decode(EmptyPlacement.self, forKey: .detatchedLegato) {
            self = .detachedLegato(value)
        } else if let value = try? container.decode(EmptyLine.self, forKey: .doit) {
            self = .doit(value)
        } else if let value = try? container.decode(EmptyLine.self, forKey: .falloff) {
            self = .falloff(value)
        } else if let value = try? container.decode(PlacementText.self, forKey: .otherArticulation) {
            self = .otherArticulation(value)
        } else if let value = try? container.decode(EmptyLine.self, forKey: .plop) {
            self = .plop(value)
        } else if let value = try? container.decode(EmptyLine.self, forKey: .scoop) {
            self = .scoop(value)
        } else if let value = try? container.decode(EmptyPlacement.self, forKey: .spicatto) {
            self = .spicatto(value)
        } else if let value = try? container.decode(EmptyPlacement.self, forKey: .staccatissimo) {
            self = .staccatissimo(value)
        } else if let value = try? container.decode(EmptyPlacement.self, forKey: .staccato) {
            self = .staccato(value)
        } else if let value = try? container.decode(StrongAccent.self, forKey: .strongAccent) {
            self = .strongAccent(value)
        } else if let value = try? container.decode(EmptyPlacement.self, forKey: .tenuto) {
            self = .tenuto(value)
        } else if let value = try? container.decode(EmptyPlacement.self, forKey: .unstress) {
            self = .unstress(value)
        } else {
            throw DecodingError.unknownKind
        }
    }
}

extension Articulation.CodingKeys: XMLChoiceCodingKey { }
