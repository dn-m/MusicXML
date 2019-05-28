//
//  Slash.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The slash type is used to indicate that slash notation is to be used.
public struct Slash {
    /// The type attribute indicates whether this is the start or stop of a slash notation style.
    public let type: StartStop
    /// The use-dots attribute works as it does for the beat-repeat element, and only has effect if
    /// use-stems is no.
    public let useDots: Bool?
    /// To indicate rhythms but not pitches, use-stems is set to yes. If the slash is on every beat,
    /// use-stems is no (the default).
    public let useStems: Bool?
    /// The slash-type element indicates the graphical note type to use for the display of
    /// repetition marks.
    public let slashType: NoteTypeValue
    /// The slash-dot element is used to specify any augmentation dots in the note type used to
    /// display repetition marks.
    public let slashDot: [Empty]
}

extension Slash: Equatable { }
extension Slash: Decodable { }
