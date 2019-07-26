//
//  TimeModification.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// Time modification indicates tuplets, double-note tremolos, and other durational changes. A
/// time-modification element shows how the cumulative, sounding effect of tuplets and double-note
/// tremolos compare to the written note type represented by the type and dot elements. Nested
/// tuplets and other notations that use more detailed information need both the time-modification
/// and tuplet elements to be represented accurately.
public struct TimeModification {
    /// The actual-notes element describes how many notes are played in the time usually occupied by
    /// the number in the normal-notes element.
    public let actualNotes: Int
    /// The normal-notes element describes how many notes are usually played in the time occupied by
    /// the number in the actual-notes element.
    public let normalNotes: Int
    /// If the type associated with the number in the normal-notes element is different than the
    /// current note type (e.g., a quarter note within an eighth note triplet), then the
    /// normal-notes type (e.g. eighth) is specified in the normal-type and normal-dot elements.
    public let normalType: NoteTypeValue
    /// The normal-dot element is used to specify dotted normal tuplet types.
    public let normalDot: [Empty]
}

extension TimeModification: Equatable { }
extension TimeModification: Codable { }
