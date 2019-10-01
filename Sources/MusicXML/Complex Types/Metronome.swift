//
//  Metronome.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

import XMLCoder

/// The metronome type represents metronome marks and other metric relationships. The beat-unit
/// group and per-minute element specify regular metronome marks. The metronome-note and
/// metronome-relation elements allow for the specification of more complicated metric
/// relationships, such as swing tempo marks where two eighths are equated to a quarter note /
/// eighth note triplet.
public struct Metronome {
    public var printStyleAlign: PrintStyleAlign?
    public var justify: Justify?
    /// The parentheses attribute indicates whether or not to put the metronome mark in parentheses;
    /// its value is no if not specified.
    public var parentheses: Bool?
    public var kind: Kind
}

extension Metronome {

    public struct Regular {

        #warning("FIXME: Establish correct model for Metronome.Regular.Relation")
        public enum Relation {
            case perMinute(PerMinute)
            case beatUnit(NoteTypeValue)
            // case beatUnit(NoteTypeValue, [Empty])
        }

        /// The beat-unit element indicates the graphical note type to use in a metronome mark.
        public let beatUnit: NoteTypeValue
        /// The beat-unit-dot element is used to specify any augmentation dots for a metronome mark
        /// note.
        public let beatUnitDot: [Empty]
        public let relation: Relation
    }

    // TODO: Consider naming
    public struct Complicated {
        public let metronomeNote: [MetronomeNote] // NonEmpty
        public let metronomeRelation: String?
        public let otherMetronomeNote: [MetronomeNote] // NonEmpty
    }

    public enum Kind {
        case regular(Regular)
        case relative(Complicated)
    }
}

extension Metronome.Regular.Relation: Equatable { }
extension Metronome.Regular.Relation: Codable {
    enum CodingKeys: String, CodingKey {
        case perMinute
        case beatUnit
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .perMinute(value):
            try container.encode(value, forKey: .perMinute)
        case let .beatUnit(value):
            try container.encode(value, forKey: .beatUnit)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .perMinute(try container.decode(PerMinute.self, forKey: .perMinute))
        } catch {
            self = .beatUnit(try container.decode(NoteTypeValue.self, forKey: .beatUnit))
        }
    }
}

extension Metronome.Regular: Equatable { }
extension Metronome.Regular: Codable { }

extension Metronome.Complicated: Equatable { }
extension Metronome.Complicated: Codable { }

extension Metronome.Kind: Equatable { }
extension Metronome.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case regular
        case relative
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .regular(value):
            try container.encode(value, forKey: .regular)
        case let .relative(value):
            try container.encode(value, forKey: .relative)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .regular(try container.decode(Metronome.Regular.self, forKey: .regular))
        } catch {
            self = .relative(try container.decode(Metronome.Complicated.self, forKey: .relative))
        }
    }
}

extension Metronome.Kind.CodingKeys: XMLChoiceCodingKey { }

extension Metronome: Equatable { }
extension Metronome: Codable {
    private enum CodingKeys: String, CodingKey {
        case printStyleAlign = "print-style-align"
        case justify
        case parentheses
        case kind
    }
}
