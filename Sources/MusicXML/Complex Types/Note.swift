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
    public var dots: [EmptyPlacement]?
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

    public var kind: Kind
}

extension Note {

    public struct Normal: Equatable {
        public var chord: Empty?
        public var pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public var duration: Int
        public var ties: [Tie] // FIXME: Make Ties struct
    }

    public struct Cue: Equatable {
        public var chord: Empty?
        public var pitchUnpitchedOrRest: PitchUnpitchedOrRest
        public var duration: Int
    }

    public struct Grace: Equatable {
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
        case dots
        case accidental
        case timeModification
        case stem
        case notehead
        case noteheadText
        case staff
        case beams
        case notations
        case lyrics
        case play
        // Kind
        case chord
        case cue
        case grace
        case duration
        case tie
        case pitch
        case unpitched
        case rest
    }
    public init(from decoder: Decoder) throws {
        fatalError()
    }
    public func encode(to encoder: Encoder) throws {
        fatalError()
    }
}
