//
//  Metronome.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The metronome type represents metronome marks and other metric relationships. The beat-unit
/// group and per-minute element specify regular metronome marks. The metronome-note and
/// metronome-relation elements allow for the specification of more complicated metric
/// relationships, such as swing tempo marks where two eighths are equated to a quarter note /
/// eighth note triplet.
public struct Metronome {
    public let printStyleAlign: PrintStyleAlign?
    public let justify: Justify?
    /// The parentheses attribute indicates whether or not to put the metronome mark in parentheses;
    /// its value is no if not specified.
    public let parentheses: Bool?
    public let kind: Kind
}

extension Metronome {

    public struct Regular {

        // TODO: Consider naming, verify correct model!
        public enum Relation {
            case perMinute(PerMinute)
            case beatUnit(NoteTypeValue, [Empty])
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
    #warning("TODO: Implement Metronome.Regular.Relation: Codable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Metronome.Regular.Relation.init(from: Decoder not yet implemented!)")
    }
}

extension Metronome.Regular: Equatable { }
extension Metronome.Regular: Codable { }

extension Metronome.Complicated: Equatable { }
extension Metronome.Complicated: Codable { }

extension Metronome.Kind: Equatable { }
extension Metronome.Kind: Codable {
    #warning("TODO: Implement Metronome.Kind: Codable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Metronome.Kind.init(from: Decoder not yet implemented!)")
    }
}

extension Metronome: Equatable { }
extension Metronome: Codable { }
