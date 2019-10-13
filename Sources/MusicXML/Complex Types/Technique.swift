//
//  Technique.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

import XMLCoder

public enum Technique {
    case arrow(Arrow)
    case bend(Bend)
    case doubleTongue(EmptyPlacement = EmptyPlacement())
    case downBow(EmptyPlacement = EmptyPlacement())
    case fingering(Fingering = Fingering())
    case fingernails(EmptyPlacement = EmptyPlacement())
    case fret(Fret = Fret())
    case hammerOn(HammerOnPullOff)
    case handbell(Handbell)
    case harmonic(Harmonic)
    case heel(HeelToe)
    case openString(EmptyPlacement = EmptyPlacement())
    case otherTechnical(PlacementText)
    case pluck(PlacementText = PlacementText())
    case pullOff(HammerOnPullOff)
    case snapPizzicato(EmptyPlacement = EmptyPlacement())
    case stopped(EmptyPlacement = EmptyPlacement())
    case string(MusicXML.String = MusicXML.String()) // FIXME: Swift.String vs. MusicXML.String
    case tap(PlacementText)
    case thumbPosition(EmptyPlacement = EmptyPlacement())
    case toe(HeelToe)
    case tripleTongue(EmptyPlacement = EmptyPlacement())
    case upBow(EmptyPlacement = EmptyPlacement())
}

extension Technique: Equatable { }
extension Technique: Codable {
    
    enum CodingKeys: String, CodingKey {
        case arrow
        case bend
        case doubleTongue = "double-tongue"
        case downBow = "down-bow"
        case fingering
        case fingernails
        case fret
        case hammerOn = "hammer-on"
        case handbell
        case harmonic
        case heel
        case openString = "open-string"
        case otherTechnical = "other-technical"
        case pluck
        case pullOff = "pull-off"
        case snapPizzicato = "snap-pizzicato"
        case stopped
        case string
        case tap
        case thumbPosition = "thumb-position"
        case toe
        case tripleTongue = "triple-tongue"
        case upBow = "up-bow"
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .arrow(value):
            try container.encode(value, forKey: .arrow)
        case let .bend(value):
            try container.encode(value, forKey: .bend)
        case let .doubleTongue(value):
            try container.encode(value, forKey: .doubleTongue)
        case let .downBow(value):
            try container.encode(value, forKey: .downBow)
        case let .fingering(value):
            try container.encode(value, forKey: .fingering)
        case let .fingernails(value):
            try container.encode(value, forKey: .fingernails)
        case let .fret(value):
            try container.encode(value, forKey: .fret)
        case let .hammerOn(value):
            try container.encode(value, forKey: .hammerOn)
        case let .handbell(value):
            try container.encode(value, forKey: .handbell)
        case let .harmonic(value):
            try container.encode(value, forKey: .harmonic)
        case let .heel(value):
            try container.encode(value, forKey: .heel)
        case let .openString(value):
            try container.encode(value, forKey: .openString)
        case let .otherTechnical(value):
            try container.encode(value, forKey: .otherTechnical)
        case let .pluck(value):
            try container.encode(value, forKey: .pluck)
        case let .pullOff(value):
            try container.encode(value, forKey: .pullOff)
        case let .snapPizzicato(value):
            try container.encode(value, forKey: .snapPizzicato)
        case let .stopped(value):
            try container.encode(value, forKey: .stopped)
        case let .string(value):
            try container.encode(value, forKey: .string)
        case let .tap(value):
            try container.encode(value, forKey: .tap)
        case let .thumbPosition(value):
            try container.encode(value, forKey: .thumbPosition)
        case let .toe(value):
            try container.encode(value, forKey: .toe)
        case let .tripleTongue(value):
            try container.encode(value, forKey: .tripleTongue)
        case let .upBow(value):
            try container.encode(value, forKey: .upBow)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.arrow) {
            self = .arrow(try decode(.arrow))
        } else if container.contains(.bend) {
            self = .bend(try decode(.bend))
        } else if container.contains(.doubleTongue) {
            self = .doubleTongue(try decode(.doubleTongue))
        } else if container.contains(.downBow) {
            self = .downBow(try decode(.downBow))
        } else if container.contains(.fingering) {
            self = .fingering(try decode(.fingering))
        } else if container.contains(.fingernails) {
            self = .fingernails(try decode(.fingernails))
        } else if container.contains(.fret) {
            self = .fret(try decode(.fret))
        } else if container.contains(.hammerOn) {
            self = .hammerOn(try decode(.hammerOn))
        } else if container.contains(.handbell) {
            self = .handbell(try decode(.handbell))
        } else if container.contains(.harmonic) {
            self = .harmonic(try decode(.harmonic))
        } else if container.contains(.heel) {
            self = .heel(try decode(.heel))
        } else if container.contains(.openString) {
            self = .openString(try decode(.openString))
        } else if container.contains(.otherTechnical) {
            self = .otherTechnical(try decode(.otherTechnical))
        } else if container.contains(.pluck) {
            self = .pluck(try decode(.pluck))
        } else if container.contains(.pullOff) {
            self = .pullOff(try decode(.pullOff))
        } else if container.contains(.snapPizzicato) {
            self = .snapPizzicato(try decode(.snapPizzicato))
        } else if container.contains(.stopped) {
            self = .stopped(try decode(.stopped))
        } else if container.contains(.string) {
            self = .string(try decode(.string))
        } else if container.contains(.tap) {
            self = .tap(try decode(.tap))
        } else if container.contains(.thumbPosition) {
            self = .thumbPosition(try decode(.thumbPosition))
        } else if container.contains(.toe) {
            self = .toe(try decode(.toe))
        } else if container.contains(.tripleTongue) {
            self = .tripleTongue(try decode(.tripleTongue))
        } else if container.contains(.upBow) {
            self = .upBow(try decode(.upBow))
        } else {
            throw DecodingError.typeMismatch(
                Technique.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension Technique.CodingKeys: XMLChoiceCodingKey { }
