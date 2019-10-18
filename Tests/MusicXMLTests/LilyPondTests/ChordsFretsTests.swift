//
//  ChordsFretsTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import XCTest
import MusicXML
import XMLCoder

class ChordsFretsTests: XCTestCase {

    func testFrame() throws {
        let xml = """
        <frame>
          <frame-strings>6</frame-strings>
          <frame-frets>4</frame-frets>
          <frame-note>
            <string>6</string>
            <fret>0</fret>
          </frame-note>
          <frame-note>
            <string>5</string>
            <fret>3</fret>
          </frame-note>
          <frame-note>
            <string>4</string>
            <fret>2</fret>
          </frame-note>
          <frame-note>
            <string>3</string>
            <fret>0</fret>
          </frame-note>
          <frame-note>
            <string>2</string>
            <fret>1</fret>
          </frame-note>
          <frame-note>
            <string>1</string>
            <fret>0</fret>
          </frame-note>
        </frame>
        """
        let decoded = try MusicXMLDecoder().decode(Frame.self, from: xml.data(using: .utf8)!)
        let expected = Frame(
            frameStrings: 6,
            frameFrets: 4,
            frameNotes: [
                FrameNote(string: 6, fret: 0),
                FrameNote(string: 5, fret: 3),
                FrameNote(string: 4, fret: 2),
                FrameNote(string: 3, fret: 0),
                FrameNote(string: 2, fret: 1),
                FrameNote(string: 1, fret: 0),
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testString() throws {
        let xml = "<string>3</string>"
        let decoded = try MusicXMLDecoder().decode(MusicXML.String.self, from: xml.data(using: .utf8)!)
        let expected = MusicXML.String(3)
        XCTAssertEqual(decoded, expected)
    }
    
    func testStringRoundTrip() throws {
        try testRoundTrip(MusicXML.String(3))
    }
}
