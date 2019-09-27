//
//  ScorePartTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class ScorePartTests: XCTestCase {

    func testDecoding() throws {
        let xml = """
        <score-part id="P1">
            <part-name>MusicXML Part</part-name>
        </score-part>
        """
        let decoded = try XMLDecoder().decode(ScorePart.self, from: xml.data(using: .utf8)!)
        let expected = ScorePart(id: "P1", name: PartName(value: "MusicXML Part"))
        XCTAssertEqual(decoded, expected)
    }

    func testDecoding_complex() throws {
        // Adopted from MuseScore export
        let xml = """
        <score-part id="P1">
            <part-name>Piano</part-name>
            <part-abbreviation>Pno.</part-abbreviation>
            <score-instrument id="P1-I1">
                <instrument-name>Piano</instrument-name>
            </score-instrument>
            <midi-device id="P1-I1" port="1"></midi-device>
            <midi-instrument id="P1-I1">
                <midi-channel>1</midi-channel>
                <midi-program>1</midi-program>
                <volume>78.7402</volume>
                <pan>0</pan>
            </midi-instrument>
        </score-part>
        """

        let decoded = try XMLDecoder().decode(ScorePart.self, from: xml.data(using: .utf8)!)
        let expected = ScorePart(
            id: "P1",
            name: PartName(value: "Piano"),
            partAbbreviation: PartName(value: "Pno."),
            scoreInstrument: [ScoreInstrument(id: "P1-I1", instrumentName: "Piano")]
            // TODO: midi-channel and midi-program are not decoding properly
//            midi: [ScorePart.MIDI(midiDevice: MIDIDevice(value: "", port: 1, id: "P1-I1"), midiInstrument: MIDIInstrument(id: "P1-I1", midiChannel: 1, midiProgram: 1, volume: 78.7402, pan: 0))]
        )
        XCTAssertEqual(decoded, expected)
    }
}
