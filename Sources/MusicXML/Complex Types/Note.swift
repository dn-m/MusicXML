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
///
/// - Warning: The `dots` and `notations` elements are currently **unsupported**.
///
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

    #warning("FIXME: #41: Note.dots not decoding properly yet")
    // public var dots: [EmptyPlacement]?

    public var accidental: Accidental?
    public var timeModification: TimeModification?
    public var stem: Stem?
    public var notehead: Notehead?
    public var noteheadText: NoteheadText?
    public var staff: Int?
    public var beams: [Beam]? // Up to 8

    #warning("FIXME: #56: Notations not decoding properly")
    // public var notations: Notations?

    public var lyrics: [Lyric]?
    public var play: Play?
}

extension Note {

    public struct Normal: Equatable, Codable {
        enum CodingKeys: String, CodingKey {
            case chord
            case duration
            case ties
            case pitchUnpitchedOrRest
        }
        public var chord: Bool = false
        public var pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public var duration: Int
        public var ties: [Tie] // FIXME: Make Ties struct
    }

    public struct Cue: Equatable, Codable {
        enum CodingKeys: String, CodingKey {
            case chord
            case pitchUnpitchedOrRest
            case duration
        }
        public var chord: Empty?
        public var pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public var duration: Int
    }

    public struct Grace: Equatable, Codable {
        enum CodingKeys: String, CodingKey {
            case chord
            case pitchUnpitchedOrRest
            case ties = "tie"
        }
        public var chord: Empty?
        public var pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public var ties: [Tie] // FIXME: Make Ties struct
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
        case attac
        case release
        case timeOnly
        case pizzicato
        // Elements
        case instrument
        case footnote
        case level
        case voice
        case type

        #warning("FIXME: #41: Note.dots not decoding properly yet")
        //case dots = "dot"

        case accidental
        case timeModification = "time-modification"
        case stem
        case notehead
        case noteheadText
        case staff
        case beams = "beam"

        #warning("FIXME: #56: Notations not decoding properly")
        //case notations

        case lyrics
        case play
    }
    public init(from decoder: Decoder) throws {
        // Ignore attributes for now
        // Decode elements
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.instrument = try container.decodeIfPresent(Instrument.self, forKey: .instrument)
        self.footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
        self.level = try container.decodeIfPresent(Level.self, forKey: .level)
        self.voice = try container.decodeIfPresent(String.self, forKey: .voice)
        self.type = try container.decodeIfPresent(NoteType.self, forKey: .type)

        #warning("FIXME: #41: Note.dots not decoding properly yet")
        // self.dots = try container.decodeIfPresent([EmptyPlacement].self, forKey: .dots)

        self.accidental = try container.decodeIfPresent(Accidental.self, forKey: .accidental)
        self.timeModification = try container.decodeIfPresent(TimeModification.self, forKey: .timeModification)
        self.stem = try container.decodeIfPresent(Stem.self, forKey: .stem)
        self.notehead = try container.decodeIfPresent(Notehead.self, forKey: .notehead)
        self.noteheadText = try container.decodeIfPresent(NoteheadText.self, forKey: .noteheadText)
        self.staff = try container.decodeIfPresent(Int.self, forKey: .staff)
        self.beams = try container.decodeIfPresent([Beam].self, forKey: .beams)

        #warning("FIXME: #56: Notations not decoding properly")
        // self.notations = try container.decodeIfPresent(Notations.self, forKey: .notations)

        self.lyrics = try container.decodeIfPresent([Lyric].self, forKey: .lyrics)
        self.play = try container.decodeIfPresent(Play.self, forKey: .play)
        // Decode pitch / unpitched / rest
        let pitchUnpitchedRestContainer = try decoder.singleValueContainer()
        let pitchUnpitchedOrRest = try pitchUnpitchedRestContainer.decode(PitchUnpitchedOrRest.self)
        // Decode kind
        do {
            let kindContainer = try decoder.container(keyedBy: Normal.CodingKeys.self)
            // FIXME: Decode ties when `Ties` struct is in plance
            self.kind = .normal(
                Normal(
                    chord: kindContainer.contains(.chord),
                    pitchUnpitchedOrRest: pitchUnpitchedOrRest,
                    duration: try kindContainer.decode(Int.self, forKey: .duration),
                    ties: []
                )
            )
        } catch {
            do {
                let kindContainer = try decoder.container(keyedBy: Cue.CodingKeys.self)
                // FIXME: Decode ties when `Ties` struct is in plance
                self.kind = .cue(
                    Cue(
                        chord: nil,
                        pitchUnpitchedOrRest: pitchUnpitchedOrRest,
                        duration: try kindContainer.decode(Int.self, forKey: .duration)
                    )
                )
            } catch {
                let kindContainer = try decoder.container(keyedBy: Grace.CodingKeys.self)
                // FIXME: Decode ties when `Ties` struct is in plance
                self.kind = .grace(
                    Note.Grace(
                        chord: nil,
                        pitchUnpitchedOrRest: pitchUnpitchedOrRest,
                        ties: []
                    )
                )
            }
        }
    }
    public func encode(to encoder: Encoder) throws {
        fatalError()
    }
}
