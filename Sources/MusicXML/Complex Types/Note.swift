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

    #warning("FIXME: Flesh out Note model. Currently only supports pitched notes")
    public var pitch: Pitch?
    public var duration: Double?
}

extension Note: Equatable { }
extension Note: Codable { }

//
//public struct Note: Codable, Equatable {
//
//    // (
//    //   ((grace, ((%full-note;, (tie, tie?)?) |(cue, %full-note;)))
//    //   |
//    //   (cue, %full-note;, duration)
//    //   |
//    //   (%full-note;, duration, (tie, tie?)?)
//    // )
//    // TODO: Kind
//
//    public enum CodingKeys: String, CodingKey {
//        case pitch
//        case duration
//        case durationType = "type"
//        case accidental
//    }
//
//    let pitch: Pitch
//    let duration: Int // amount of "divisions"
//    let durationType: DurationType
//    let accidental: Accidental?
//}
