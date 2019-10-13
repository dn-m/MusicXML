//
//  MIDIInstrumentTests.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 9/30/19.
//


import Foundation

import XCTest
import XMLCoder
import MusicXML

class MIDIInstrumentTests: XCTestCase {

    func testDecoding() throws {
        let xml = """
        <midi-instrument id="P1-I2">
            <midi-channel>1</midi-channel>
            <midi-program>1</midi-program>
            <volume>50</volume>
            <pan>-45</pan>
        </midi-instrument>
        """
        let decoded = try XMLDecoder().decode(MIDIInstrument.self, from: xml.data(using: .utf8)!)
        let expected = MIDIInstrument(id: "P1-I2", midiChannel: 1, midiProgram: 1, volume: 50, pan: -45)

        XCTAssertEqual(decoded, expected)
    }

    func testEncoding() throws {
        let midiInstrument = MIDIInstrument(id: "P1-I1", midiChannel: 1, midiProgram: 1, volume: 78.7402, pan: 0)
        let encoded = String(data: try XMLEncoder().encode(midiInstrument, withRootKey: "midi-instrument"), encoding: .utf8)!

        XCTAssertEqual(encoded, #"<midi-instrument id="P1-I1"><midi-channel>1</midi-channel><midi-program>1</midi-program><volume>78.7402</volume><pan>0</pan></midi-instrument>"#)
    }
}
