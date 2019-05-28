//
//  Sound.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The sound element contains general playback parameters. They can stand alone within a
/// part/measure, or be a component element within a direction.
///
/// Tempo is expressed in quarter notes per minute. If 0, the sound-generating program should prompt
/// the user at the time of compiling a sound (MIDI) file.
///
/// Dynamics (or MIDI velocity) are expressed as a percentage of the default forte value (90 for
/// MIDI 1.0).
///
/// MIDI devices, MIDI instruments, and playback techniques are changed using the midi-device,
/// midi-instrument, and play elements. When there are multiple instances of these elements, they
/// should be grouped together by instrument using the id attribute values.
///
/// The offset element is used to indicate that the sound takes place offset from the current score
/// position. If the sound element is a child of a direction element, the sound offset element
/// overrides the direction offset element if both elements are present. Note that the offset
/// reflects the intended musical position for the change in sound. It should not be used to
/// compensate for latency issues in particular hardware configurations.
public struct Sound {
    public let tempo: Double?
    public let dynamics: Double?
    public let dacapo: Bool?
    public let segno: String?
    public let dalsegno: String?
    public let coda: String?
    public let tocoda: String?
    public let divisions: Divisions?
    public let forwardRepeat: Bool?
    public let fine: String?
    public let timeOnly: TimeOnly?
    public let pizzicato: Bool?
    public let pan: Double?
    public let elevation: Double?
    public let damperPedal: YesNoNumber?
    public let softPedal: YesNoNumber?
    public let sostenutoPedal: YesNoNumber?
    public let offset: Offset?
    public let midi: [MIDI]
}

extension Sound {
    public struct MIDI {
        /// The midi-device type corresponds to the DeviceName meta event in Standard MIDI Files.
        /// Unlike the DeviceName meta event, there can be multiple midi-device elements per
        /// MusicXML part starting in MusicXML 3.0.
        public let midiDevice: MIDIDevice?

        /// The midi-instrument type defines MIDI 1.0 instrument playback. The midi-instrument
        /// element can be a part of either the score-instrument element at the start of a part, or
        /// the sound element within a part. The id attribute refers to the score-instrument
        /// affected by the change.
        public let midiInstrument: MIDIInstrument?

        /// The play type, new in Version 3.0, specifies playback techniques to be used in
        /// conjunction with the instrument-sound element. When used as part of a sound element, it
        /// applies to all notes going forward in score order. In multi-instrument parts, the
        /// affected instrument should be specified using the id attribute. When used as part of a
        /// note element, it applies to the current note only.
        public let play: Play?
    }
}

extension Sound.MIDI: Equatable { }
extension Sound.MIDI: Decodable { }

extension Sound: Equatable { }
extension Sound: Decodable { }
