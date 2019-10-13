//
//  ScorePartTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
import MusicXML

class ScorePartTests: XCTestCase {
    // Adopted from MuseScore export
    static let complexXml = """
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
        <midi-device id="P1-I2" port="2"></midi-device>
        <midi-instrument id="P1-I2">
            <midi-channel>1</midi-channel>
            <midi-program>1</midi-program>
            <volume>50</volume>
            <pan>-45</pan>
        </midi-instrument>
    </score-part>
    """

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
        let decoded = try XMLDecoder().decode(ScorePart.self, from: ScorePartTests.complexXml.data(using: .utf8)!)
        let expected = ScorePart(
            id: "P1",
            name: PartName(value: "Piano"),
            partAbbreviation: PartName(value: "Pno."),
            scoreInstrument: [ScoreInstrument(id: "P1-I1", instrumentName: "Piano")],
            midi: [
                ScorePart.MIDI(midiDevice: MIDIDevice(port: 1, id: "P1-I1"), midiInstrument: MIDIInstrument(id: "P1-I1", midiChannel: 1, midiProgram: 1, volume: 78.7402, pan: 0)),
                ScorePart.MIDI(midiDevice: MIDIDevice(port: 2, id: "P1-I2"), midiInstrument: MIDIInstrument(id: "P1-I2", midiChannel: 1, midiProgram: 1, volume: 50, pan: -45))
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testRoundTrip() throws {
        let decoded = try XMLDecoder().decode(ScorePart.self, from: ScorePartTests.complexXml.data(using: .utf8)!)
        let encodedData = try XMLEncoder().encode(decoded, withRootKey: "score-part")
        let decoded2 = try XMLDecoder().decode(ScorePart.self, from: encodedData)

        XCTAssertEqual(decoded, decoded2)
    }

    func testComplex() throws {
        let xml = """
        <score-part id="P2">
          <part-name>Part name</part-name>
          <part-name-display><display-text>Overridden Part Name</display-text></part-name-display>
          <part-abbreviation>abbrv.</part-abbreviation>
          <part-abbreviation-display><display-text>Overr.abbrv.</display-text></part-abbreviation-display>
        </score-part>
        """
        let decoded = try XMLDecoder().decode(ScorePart.self, from: xml.data(using: .utf8)!)
        let expected = ScorePart(
            id: "P2",
            name: "Part name",
            nameDisplay: NameDisplay(texts: [.displayText("Overridden Part Name")]),
            partAbbreviation: "abbrv.",
            partAbbreviationDisplay: NameDisplay(texts: [.displayText("Overr.abbrv.")])
        )
        XCTAssertEqual(decoded, expected)
    }
}
