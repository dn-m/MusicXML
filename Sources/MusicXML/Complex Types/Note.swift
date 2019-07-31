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

    public let instrument: Instrument?
    public let footnote: FormattedText?
    public let level: Level?
    public let voice: String?
    public let type: NoteType?
    public let dots: [EmptyPlacement]
    public let accidental: Accidental?
    public let timeModification: TimeModification?
    public let stem: Stem?
    public let notehead: Notehead?
    public let noteheadText: NoteheadText?

    public let staff: Int?
    public let beams: [Beam] // Up to 8
    public let notations: Notations
    public let lyrics: [Lyric]
    public let play: Play?

    #warning("TODO: Complete Note Content Model")
}

extension Note: Equatable { }
extension Note: Codable { }
//
//public struct Note: Codable, Equatable {
//
//    // (
//    //   ((grace, ((%full-note;, (tie, tie?)?) | (cue, %full-note;)))
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
