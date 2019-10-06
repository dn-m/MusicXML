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

    public let kind: Kind

    // MARK: - Attributes

    public let position: Position
    public let fontFamily: CommaSeparatedText?
    public let fontStyle: FontStyle?
    public let fontSize: FontSize?
    public let fontWeight: FontWeight?
    public let color: Color?
    public let printStyle: PrintStyle?
    public let printObject: Bool?
    public let printDot: Bool?
    public let printSpacing: Bool?
    public let printLyric: Bool?
    public let dynamics: Double?
    public let endDynamics: Double?
    public let attack: Divisions?
    public let release: Divisions?
    public let timeOnly: TimeOnly?
    public let pizzicato: Bool?

    // MARK: - Elements

    public let instrument: Instrument?
    public let footnote: FormattedText?
    public let level: Level?
    public let voice: String?
    public let type: NoteType?
    public let dots: [EmptyPlacement]?
    public let accidental: Accidental?
    public let timeModification: TimeModification?
    public let stem: Stem?
    public let notehead: Notehead?
    public let noteheadText: NoteheadText?
    public let staff: Int?
    public let beams: [Beam]? // Up to 8
    public let notations: Notations?
    public let lyrics: [Lyric]?
    public let play: Play?

    public init(
        kind: Kind,
        position: Position = Position(),
        fontFamily: CommaSeparatedText? = nil,
        fontStyle: FontStyle? = nil,
        fontSize: FontSize? = nil,
        fontWeight: FontWeight? = nil,
        color: Color? = nil,
        printStyle: PrintStyle? = nil,
        printObject: Bool? = nil,
        printDot: Bool? = nil,
        printSpacing: Bool? = nil,
        printLyric: Bool? = nil,
        dynamics: Double? = nil,
        endDynamics: Double? = nil,
        attack: Divisions? = nil,
        release: Divisions? = nil,
        timeOnly: TimeOnly? = nil,
        pizzicato: Bool? = nil,
        instrument: Instrument? = nil,
        footnote: FormattedText? = nil,
        level: Level? = nil,
        voice: String? = nil,
        type: NoteType? = nil,
        dots: [EmptyPlacement]? = nil,
        accidental: Accidental? = nil,
        timeModification: TimeModification? = nil,
        stem: Stem? = nil,
        notehead: Notehead? = nil,
        noteheadText: NoteheadText? = nil,
        staff: Int? = nil,
        beams: [Beam]? = nil,
        notations: Notations? = nil,
        lyrics: [Lyric]? = nil,
        play: Play? = nil) {

        self.kind = kind
        self.position = position
        self.fontFamily = fontFamily
        self.fontStyle = fontStyle
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.color = color
        self.printStyle = printStyle
        self.printObject = printObject
        self.printDot = printDot
        self.printSpacing = printSpacing
        self.printLyric = printLyric
        self.dynamics = dynamics
        self.endDynamics = endDynamics
        self.attack = attack
        self.release = release
        self.timeOnly = timeOnly
        self.pizzicato = pizzicato
        self.instrument = instrument
        self.footnote = footnote
        self.level = level
        self.voice = voice
        self.type = type
        self.dots = dots
        self.accidental = accidental
        self.timeModification = timeModification
        self.stem = stem
        self.notehead = notehead
        self.noteheadText = noteheadText
        self.staff = staff
        self.beams = beams
        self.notations = notations
        self.lyrics = lyrics
        self.play = play
    }
}

extension Note {
    public struct Normal: Equatable {
        public let chord: Bool
        public let pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public let duration: Int
        public let ties: Ties?

        public init(chord: Bool = false, pitchUnpitchedOrRest: PitchUnpitchedOrRest, duration: Int, ties: Ties? = nil) {
            self.chord = chord
            self.pitchUnpitchedOrRest = pitchUnpitchedOrRest
            self.duration = duration
            self.ties = ties
        }
    }

    public struct Cue: Equatable {
        public let chord: Bool
        public let pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public let duration: Int

        public init(chord: Bool = false, pitchUnpitchedOrRest: PitchUnpitchedOrRest, duration: Int) {
            self.chord = chord
            self.pitchUnpitchedOrRest = pitchUnpitchedOrRest
            self.duration = duration
        }
    }

    public struct Grace: Equatable {
        public let chord: Bool
        public let pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public let ties: Ties?

        public init(chord: Bool = false, pitchUnpitchedOrRest: PitchUnpitchedOrRest, ties: Ties? = nil) {
            self.chord = chord
            self.pitchUnpitchedOrRest = pitchUnpitchedOrRest
            self.ties = ties
        }
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
        case fontFamily = "font-family"
        case fontStyle = "font-style"
        case fontSize = "font-size"
        case fontWeight = "font-weight"
        case color
        case printStyle = "print-style"
        case printObject = "print-object"
        case printDot = "print-dot"
        case printSpacing = "print-spacing"
        case printLyric = "print-lyric"
        case dynamics
        case endDynamics = "end-dynamics"
        case attack
        case release
        case timeOnly = "time-only"
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
        
        case pitch
        case rest
        case unpitched
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Attributes
        self.position = try Position(from: decoder)
        self.fontFamily = try container.decodeIfPresent(CommaSeparatedText.self, forKey: .fontFamily)
        self.fontStyle = try container.decodeIfPresent(FontStyle.self, forKey: .fontStyle)
        self.fontSize = try container.decodeIfPresent(FontSize.self, forKey: .fontSize)
        self.fontWeight = try container.decodeIfPresent(FontWeight.self, forKey: .fontWeight)
        self.color = try container.decodeIfPresent(Color.self, forKey: .color)
        self.printStyle = try container.decodeIfPresent(PrintStyle.self, forKey: .printStyle)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        self.printDot = try container.decodeIfPresent(Bool.self, forKey: .printDot)
        self.printSpacing = try container.decodeIfPresent(Bool.self, forKey: .printSpacing)
        self.printLyric = try container.decodeIfPresent(Bool.self, forKey: .printLyric)
        self.dynamics = try container.decodeIfPresent(Double.self, forKey: .dynamics)
        self.endDynamics = try container.decodeIfPresent(Double.self, forKey: .endDynamics)
        self.attack = try container.decodeIfPresent(Divisions.self, forKey: .attack)
        self.release = try container.decodeIfPresent(Divisions.self, forKey: .release)
        self.timeOnly = try container.decodeIfPresent(TimeOnly.self, forKey: .timeOnly)
        self.pizzicato = try container.decodeIfPresent(Bool.self, forKey: .pizzicato)
        // Decode elements
        self.instrument = try container.decodeIfPresent(Instrument.self, forKey: .instrument)
        self.footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
        self.level = try container.decodeIfPresent(Level.self, forKey: .level)
        self.voice = try container.decodeIfPresent(String.self, forKey: .voice)
        self.type = try container.decodeIfPresent(NoteType.self, forKey: .type)

        self.dots = try container.decodeIfPresent([EmptyPlacement].self, forKey: .dots)
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
        let pitchUnpitchedOrRest: PitchUnpitchedOrRest
        if container.contains(.pitch) {
            let pitch = try container.decode(Pitch.self, forKey: .pitch)
            pitchUnpitchedOrRest = .pitch(pitch)
        } else if container.contains(.rest) {
            let rest = try container.decode(Rest.self, forKey: .rest)
            pitchUnpitchedOrRest =  .rest(rest)
        } else {
            let unpitched = try container.decode(Unpitched.self, forKey: .unpitched)
            pitchUnpitchedOrRest = .unpitched(unpitched)
        }

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
