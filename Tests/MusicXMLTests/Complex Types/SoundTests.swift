//
//  SoundTests.swift
//  MusicXMLTests
//
//  Created by Benjamin Wetherfield on 11/21/19.
//

import MusicXML
import XCTest
import XMLCoder

class SoundTests: XCTestCase {
    func testSoundPlayDecoding() throws {
        let xml = """
        <sound>
            <play>
                <semi-pitched>very-low</semi-pitched>
            </play>
        </sound>
        """
        let decoded = Sound(midi: [
            Sound.MIDI(play: Play(
                [.semiPitched(.veryLow)]
            )),
        ])
        try assertDecoded(xml, equals: decoded)
    }

    func testSoundMidiInstrumentPlay() throws {
        let xml = """
        <sound>
            <midi-instrument id="some midi"/>
            <play>
                <semi-pitched>very-low</semi-pitched>
            </play>
        </sound>
        """
        let decoded = Sound(midi: [
            Sound.MIDI(
                midiInstrument: MIDIInstrument(id: "some midi"),
                play: Play([.semiPitched(.veryLow)])
            ),
        ])
        try assertDecoded(xml, equals: decoded)
    }

    func testSoundMidiInstrumentPlayPlay() throws {
        let xml = """
        <sound>
            <midi-instrument id="some midi"/>
            <play>
                <semi-pitched>very-low</semi-pitched>
            </play>
            <play>
                <semi-pitched>very-low</semi-pitched>
            </play>
        </sound>
        """
        let decoded = Sound(midi: [
            Sound.MIDI(
                midiInstrument: MIDIInstrument(id: "some midi"),
                play: Play([.semiPitched(.veryLow)])
            ),
            Sound.MIDI(play: Play(
                [.semiPitched(.veryLow)]
            )),
        ])
        try assertDecoded(xml, equals: decoded)
    }

    func testSoundMIDI() throws {
        let xml = """
        <sound>
          <play>
            <semi-pitched>very-low</semi-pitched>
          </play>
        </sound>
        """
        let decoded = Sound.MIDI(play: Play(
            [.semiPitched(.veryLow)]
        ))
        try assertDecoded(xml, equals: decoded)
    }

    func testBasicPlay() throws {
        let xml = """
        <play>
            <semi-pitched>very-low</semi-pitched>
        </play>
        """
        let decoded = Play([.semiPitched(.veryLow)])
        try assertDecoded(xml, equals: decoded)
    }

    func testBasicSemiPitched() throws {
        let xml = """
        <play>
            <semi-pitched>very-low</semi-pitched>
        </play>
        """
        let decoded = Play.Kind.semiPitched(.veryLow)
        try assertDecoded(xml, equals: decoded)
    }
}
