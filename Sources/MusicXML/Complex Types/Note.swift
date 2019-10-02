//
//  Note.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Notes are the most common type of MusicXML data. The MusicXML format keeps the MuseData
/// distinction between elements used for sound information and elements used for notation
/// information (e.g., tie is used for sound, tied for notation). Thus grace notes do not have a
/// duration element. Cue notes have a duration element, as do forward elements, but no tie
/// elements. Having these two types of information available can make interchange considerably
/// easier, as some programs handle one type of information much more readily than the other.
public struct Note {

    public var kind: Kind

    // MARK: - Attributes

    public var printStyle: PrintStyle?
    public var printObject: Bool?
    public var printDot: Bool?
    public var printSpacing: Bool?
    public var printLyric: Bool?
    public var dynamics: Double?
    public var endDynamics: Double?
    public var attack: Divisions?
    public var release: Divisions?
    public var timeOnly: TimeOnly?
    public var pizzicato: Bool?

    // MARK: - Elements

    public var instrument: Instrument?
    public var footnote: FormattedText?
    public var level: Level?
    public var voice: String?
    public var type: NoteType?
    #warning("Reinstate Note.dots when we can decode potentially-empty elements properly")
    // public var dots: [EmptyPlacement]?
    public var accidental: Accidental?
    public var timeModification: TimeModification?
    public var stem: Stem?
    public var notehead: Notehead?
    public var noteheadText: NoteheadText?
    public var staff: Int?
    public var beams: [Beam]? // Up to 8
    public var notations: Notations?
    public var lyrics: [Lyric]?
    public var play: Play?
}

extension Note {
    public struct Normal: Equatable {
        public var chord = false
        public var pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public var duration: Int
        public var ties: Ties?
    }

    public struct Cue: Equatable {
        public var chord = false
        public var pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public var duration: Int
    }

    public struct Grace: Equatable {
        public var chord = false
        public var pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public var ties: Ties?
    }

    public enum Kind: Equatable {
        case normal(Normal)
        case cue(Cue)
        case grace(Grace)
    }
}

extension Note: Equatable { }
extension Note: Codable {
    enum CodingKeys: String, CodingKey {
        // Attributes
        case printStyle
        case printObject
        case printDot
        case printSpacing
        case printLyric
        case dynamics
        case endDynamics
        case attack
        case release
        case timeOnly
        case pizzicato
        // Elements
        case instrument
        case footnote
        case level
        case voice
        case type
        case dots = "dot"
        case accidental
        case timeModification = "time-modification"
        case stem
        case notehead
        case noteheadText
        case staff
        case beams = "beam"
        case notations
        case lyrics
        case play
        // Normal Note, Cue and Grace
        case grace
        case cue
        case chord
        case duration
        case tie
    }
    #warning("Reinstate Note.dots when we can decode potentially-empty elements properly")
    public init(from decoder: Decoder) throws {
        // Ignore attributes for now
        // Decode elements
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.instrument = try container.decodeIfPresent(Instrument.self, forKey: .instrument)
        self.footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
        self.level = try container.decodeIfPresent(Level.self, forKey: .level)
        self.voice = try container.decodeIfPresent(String.self, forKey: .voice)
        self.type = try container.decodeIfPresent(NoteType.self, forKey: .type)

        // self.dots = try container.decodeIfPresent([EmptyPlacement].self, forKey: .dots)
        self.accidental = try container.decodeIfPresent(Accidental.self, forKey: .accidental)
        self.timeModification = try container.decodeIfPresent(TimeModification.self, forKey: .timeModification)
        self.stem = try container.decodeIfPresent(Stem.self, forKey: .stem)
        self.notehead = try container.decodeIfPresent(Notehead.self, forKey: .notehead)
        self.noteheadText = try container.decodeIfPresent(NoteheadText.self, forKey: .noteheadText)
        self.staff = try container.decodeIfPresent(Int.self, forKey: .staff)
        self.beams = try container.decodeIfPresent([Beam].self, forKey: .beams)
        self.notations = try container.decodeIfPresent(Notations.self, forKey: .notations)
        self.lyrics = try container.decodeIfPresent([Lyric].self, forKey: .lyrics)
        self.play = try container.decodeIfPresent(Play.self, forKey: .play)
        let chordEmptyElement = try container.decodeIfPresent(Empty.self, forKey: .chord)
        let ties = try container.decodeIfPresent([Tie].self, forKey: .tie).map(Ties.init)

        // Decode pitch / unpitched / rest
        let pitchUnpitchedRestContainer = try decoder.singleValueContainer()
        let pitchUnpitchedOrRest = try pitchUnpitchedRestContainer.decode(PitchUnpitchedOrRest.self)
        // Decode kind
        if container.contains(.grace) {
            self.kind = .grace(
                Note.Grace(
                    chord: chordEmptyElement != nil,
                    pitchUnpitchedOrRest: pitchUnpitchedOrRest,
                    ties: ties
                )
            )
        } else if container.contains(.cue) {
            self.kind = .cue(
                Note.Cue(
                    chord: chordEmptyElement != nil,
                    pitchUnpitchedOrRest: pitchUnpitchedOrRest,
                    duration: try container.decode(Int.self, forKey: .duration)
                )
            )
        } else {
            self.kind = .normal(
                Normal(
                    chord: chordEmptyElement != nil,
                    pitchUnpitchedOrRest: pitchUnpitchedOrRest,
                    duration: try container.decode(Int.self, forKey: .duration),
                    ties: ties
                )
            )
        }
    }
    public func encode(to encoder: Encoder) throws {
        fatalError()
    }
}
