//
//  TrillSound.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The trill-sound attribute group includes attributes used to guide the sound of trills, mordents,
/// turns, shakes, and wavy lines, based on MuseData sound suggestions. The default choices are:
///
///     start-note = "upper"
///     trill-step = "whole"
///     two-note-turn = "none"
///     accelerate = "no"
///     beats = "4".
///
/// Second-beat and last-beat are percentages for landing on the indicated beat, with defaults of 25
/// and 75 respectively.
///
/// For mordent and inverted-mordent elements, the defaults are different:
///
///     The default start-note is "main", not "upper".
///     The default for beats is "3", not "4".
///     The default for second-beat is "12", not "25".
///     The default for last-beat is "24", not "75".
///
public struct TrillSound: Decodable, Equatable {
    let startNote: StartNote
    let trillStep: TrillStep
    let twoNoteTurn: TwoNoteTurn
    let accelerate: Bool
    let beats: Int
    let secondBeat: Int
    let lastBeat: Int
}
