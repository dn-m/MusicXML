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
        public let beatUnitDots: Int
        public let relation: Relation

        public init(beatUnit: NoteTypeValue, beatUnitDots: Int = 0, relation: Relation) {
            self.beatUnit = beatUnit
            self.beatUnitDots = beatUnitDots
            self.relation = relation
        }

        init(components: [MetronomeRegularComponent]) throws {
            var componentsCopy = components
            guard let firstComponent = componentsCopy.first, case let .beatUnit(beatUnit) = firstComponent else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Requires beat-unit to be present"))
            }
            self.beatUnit = beatUnit
            componentsCopy.removeFirst()

            func isBeatUnitDot(_ component: MetronomeRegularComponent) -> Bool {
                if case .beatUnitDot = component {
                    return true
                }
                return false
            }

            let beatUnitDot = componentsCopy.prefix(while: isBeatUnitDot).map { _ in Empty() }
            self.beatUnitDots = beatUnitDot.count
            componentsCopy = [MetronomeRegularComponent](componentsCopy.drop(while: isBeatUnitDot))
            guard let firstRelationComponent = componentsCopy.first else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Requires per-minute or beat-unit to be present"))
            }

            switch firstRelationComponent {
                case let .perMinute(perMinute):
                    self.relation = .perMinute(perMinute)
                case let .beatUnit(beatUnit):
                    componentsCopy.removeFirst()
                    let beatUnitDotInRelation = componentsCopy.prefix(while: isBeatUnitDot).map { _ in Empty() }
                    self.relation = .beatUnit(beatUnit, beatUnitDotInRelation.isEmpty ? nil : beatUnitDotInRelation)
                default:
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Requires per-minute or beat-unit to be present"))
            }
        }
    }

    // TODO: Consider renaming Metronome.Complicated
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

extension Metronome.Regular: Equatable { }

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
            var metronomeRegularComponents = [MetronomeRegularComponent]()
            var valuesContainer = try decoder.unkeyedContainer()
            while !valuesContainer.isAtEnd {
                do {
                    metronomeRegularComponents.append(try valuesContainer.decode(MetronomeRegularComponent.self))
                } catch DecodingError.typeMismatch(let type, _) where type == MetronomeRegularComponent.self {
                    break
                }
            }
            self.kind = .regular(try Metronome.Regular(components: metronomeRegularComponents))
        } else {
            self.kind = .relative(try Metronome.Complicated(from: decoder))
        }
    }
}

enum MetronomeRegularComponent {
    case beatUnit(NoteTypeValue)
    case beatUnitDot(Empty)
    case perMinute(PerMinute)
}

extension MetronomeRegularComponent: Decodable {
    enum CodingKeys: String, CodingKey {
        case beatUnit = "beat-unit"
        case beatUnitDot = "beat-unit-dot"
        case perMinute = "per-minute"
    }
    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.beatUnit) {
            self = .beatUnit(try decode(.beatUnit))
        } else if container.contains(.beatUnitDot) {
            self = .beatUnitDot(try decode(.beatUnitDot))
        } else if container.contains(.perMinute) {
            self = .perMinute(try decode(.perMinute))
        } else {
            throw DecodingError.typeMismatch(
                MetronomeRegularComponent.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension MetronomeRegularComponent.CodingKeys: XMLChoiceCodingKey {}
