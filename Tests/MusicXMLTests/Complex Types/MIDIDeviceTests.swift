//
//  MIDIDeviceTests.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 9/30/19.
//

import Foundation

import XCTest
import XMLCoder
import MusicXML

class MIDIDeviceTests: XCTestCase {

    func testDecoding() throws {
        let xml = """
        <midi-device id="P1-I1" port="1"></midi-device>
        """
        let decoded = try XMLDecoder().decode(MIDIDevice.self, from: xml.data(using: .utf8)!)
        let expected = MIDIDevice(port: 1, id: "P1-I1")

        XCTAssertEqual(decoded, expected)
    }

    func testEncoding() throws {
        let midiDevice = MIDIDevice(port: 1, id: "P1-I1")
        let encoded = String(data: try XMLEncoder().encode(midiDevice, withRootKey: "midi-device"), encoding: .utf8)!

        XCTAssertEqual(encoded, #"<midi-device id="P1-I1" port="1" />"#)
    }
}
