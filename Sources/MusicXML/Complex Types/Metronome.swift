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
    // MARK: - Attributes
    public let position: Position
    public let printStyleAlign: PrintStyleAlign?
    public let justify: Justify?
    /// The parentheses attribute indicates whether or not to put the metronome mark in parentheses;
    /// its value is no if not specified.
    public let parentheses: Bool?

    // MARK: - Elements
    public let kind: Kind

    public init(position: Position = Position(), printStyleAlign: PrintStyleAlign? = nil, justify: Justify? = nil, parentheses: Bool? = nil, kind: Kind) {
        self.position = position
        self.printStyleAlign = printStyleAlign
        self.justify = justify
        self.parentheses = parentheses
        self.kind = kind
    }
}

extension Metronome {

    public struct Regular {
        public enum Relation {
            case perMinute(PerMinute)
            case beatUnit(NoteTypeValue, [Empty]? = nil)
        }
        
        /// The beat-unit element indicates the graphical note type to use in a metronome mark.
        public let beatUnit: NoteTypeValue
        /// The beat-unit-dot element is used to specify any augmentation dots for a metronome mark
        /// note.
        public let beatUnitDot: [Empty]?
        public let relation: Relation

        public init(beatUnit: NoteTypeValue, beatUnitDot: [Empty]? = nil, relation: Relation) {
            self.beatUnit = beatUnit
            self.beatUnitDot = beatUnitDot
            self.relation = relation
        }
    }

    #warning("TODO: Consider renaming Metronome.Complicated")
    public struct Complicated {
        public let metronomeNote: [MetronomeNote] // NonEmpty
        public let metronomeRelation: String
        public let otherMetronomeNote: [MetronomeNote] // NonEmpty

        public init(metronomeNote: [MetronomeNote], metronomeRelation: String, otherMetronomeNote: [MetronomeNote]) {
            self.metronomeNote = metronomeNote
            self.metronomeRelation = metronomeRelation
            self.otherMetronomeNote = otherMetronomeNote
        }
    }

    public enum Kind {
        case regular(Regular)
        case relative(Complicated)
    }
}

extension Metronome.Regular.Relation: Equatable { }
extension Metronome.Regular.Relation: Codable {
    enum CodingKeys: String, CodingKey {
        case perMinute = "per-minute"
        case beatUnit = "beat-unit"
        case beatUnitDot = "beat-unit-dot"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .perMinute(value):
            try container.encode(value, forKey: .perMinute)
        case let .beatUnit(value, dots):
            try container.encode(value, forKey: .beatUnit)
            try container.encode(dots, forKey: .beatUnitDot)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.perMinute) {
            self = .perMinute(try container.decode(PerMinute.self, forKey: .perMinute))
        } else if container.contains(.beatUnit) {
            let beatUnit = try container.decode(NoteTypeValue.self, forKey: .beatUnit)
            let beatUnitDot = try container.decodeIfPresent([Empty].self, forKey: .beatUnitDot)
            self = .beatUnit(beatUnit, beatUnitDot)
        } else {
            throw DecodingError.typeMismatch(
                Metronome.Regular.Relation.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension Metronome.Regular: Equatable { }
extension Metronome.Regular: Codable {
    enum CodingKeys: String, CodingKey {
        case beatUnit = "beat-unit"
        case beatUnitDot = "beat-unit-dot"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.beatUnit = try container.decode(NoteTypeValue.self, forKey: .beatUnit)
        self.beatUnitDot = try container.decodeIfPresent([Empty].self, forKey: .beatUnitDot)
        self.relation = try Relation(from: decoder)
    }
}

extension Metronome.Complicated: Equatable { }
extension Metronome.Complicated: Codable {
    enum CodingKeys: String, CodingKey {
        case metronomeNote = "metronome-note"
        case metronomeRelation = "metronome-relation"
        case otherMetronomeNote = "other-metronome-note"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metronomeNote = try container.decode([MetronomeNote].self, forKey: .metronomeNote)
        self.metronomeRelation = try container.decode(String.self, forKey: .metronomeRelation)
        self.otherMetronomeNote = try container.decode([MetronomeNote].self, forKey: .otherMetronomeNote)
    }
}

extension Metronome.Kind: Equatable { }

extension Metronome: Equatable { }
extension Metronome: Codable {
    private enum CodingKeys: String, CodingKey {
        case position
        case printStyleAlign = "print-style-align"
        case justify
        case parentheses

        case beatUnit = "beat-unit"
        case beatUnitDot = "beat-unit-dot"

        case metronomeNote = "metronome-note"
    }

    public func encode(to encoder: Encoder) throws {
        fatalError("TODO")
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.position = try Position(from: decoder)
        self.printStyleAlign = try container.decodeIfPresent(PrintStyleAlign.self, forKey: .printStyleAlign)
        self.justify = try container.decodeIfPresent(Justify.self, forKey: .justify)
        self.parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses)

        if container.contains(.beatUnit) {
            // Decode regular type
            self.kind = .regular(try Metronome.Regular(from: decoder))
        } else {
            self.kind = .relative(try Metronome.Complicated(from: decoder))
        }
    }
}
