//
//  Articulation.swift
//  MusicXML
//
//  Created by James Bean on 8/9/19.
//

import XMLCoder

/// Articulations and accents are grouped together here.
public enum Articulation {
    case accent(PlacementPrintStyle = PlacementPrintStyle())
    case breathMark(BreathMark = BreathMark())
    case caesura(PlacementPrintStyle = PlacementPrintStyle())
    case detachedLegato(PlacementPrintStyle = PlacementPrintStyle())
    case doit(Line = Line())
    case falloff(Line = Line())
    case otherArticulation(PlacementText)
    case plop(Line = Line())
    case scoop(Line = Line())
    case spiccato(PlacementPrintStyle = PlacementPrintStyle())
    case staccatissimo(PlacementPrintStyle = PlacementPrintStyle())
    case staccato(PlacementPrintStyle = PlacementPrintStyle())
    case stress(PlacementPrintStyle = PlacementPrintStyle())
    case strongAccent(StrongAccent = StrongAccent())
    case tenuto(PlacementPrintStyle = PlacementPrintStyle())
    case unstress(PlacementPrintStyle = PlacementPrintStyle())
}

extension Articulation: Equatable {}

extension Articulation: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case accent
        case breathMark = "breath-mark"
        case caesura
        case detachedLegato = "detached-legato"
        case doit
        case falloff
        case otherArticulation = "other-articulation"
        case plop
        case scoop
        case spiccato
        case staccatissimo
        case staccato
        case stress
        case strongAccent = "strong-accent"
        case tenuto
        case unstress
    }

    // MARK: Encodable

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
        case let .spiccato(value):
            try container.encode(value, forKey: .spiccato)
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

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
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
        } else if container.contains(.spiccato) {
            self = .spiccato(try decode(.spiccato))
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
}

extension Articulation.CodingKeys: XMLChoiceCodingKey {}
