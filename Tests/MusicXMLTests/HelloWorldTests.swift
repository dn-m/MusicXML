//
//  HelloWorldTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/3/18.
//

import XCTest
import MusicXML

class HelloWorldTests: XCTestCase {

    // Assert that the XML string provided is deserialized to the same `Score` as the one
    // implemented manually.
    func testHelloWorld() {
        let result = try! MusicXML.deserialize(helloWorld)
        let expected = MusicXML.helloWorld
        XCTAssertEqual(result, expected)
    }
}

extension MusicXML {
    /// - Returns: The "Hello, World" example from: https://www.musicxml.com/tutorial/hello-world/.
    static let helloWorld = Score(
        traverse: .partwise(
            Partwise(
                partList: [
                    ScorePart(
                        id: "P1",
                        name: "Music"
                    )
                ],
                parts: [
                    Part(
                        id: "P1",
                        measures: [
                            Measure(
                                number: 1,
                                attributes: [
                                    .divisions(1),
                                    .key(Key(fifths: 0)),
                                    .time(4,4),
                                    .clef(Clef(sign: .G, line: 2)) // treble clef
                                ],
                                notes: [
                                    Note(
                                        pitch: Pitch(step: "C", octave: 4),
                                        duration: 4,
                                        type: .whole
                                    )
                                ]
                            )
                        ]
                    )
                ]
            )
        )
    )
}

/// The MusicXML representation of the "Hello, World" example.
let helloWorld = """
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE score-partwise PUBLIC
    "-//Recordare//DTD MusicXML 3.1 Partwise//EN"
    "http://www.musicxml.org/dtds/partwise.dtd">
<score-partwise version="3.1">
  <part-list>
    <score-part id="P1">
      <part-name>Music</part-name>
    </score-part>
  </part-list>
  <part id="P1">
    <measure number="1">
      <attributes>
        <divisions>1</divisions>
        <key>
          <fifths>0</fifths>
        </key>
        <time>
          <beats>4</beats>
          <beat-type>4</beat-type>
        </time>
        <clef>
          <sign>G</sign>
          <line>2</line>
        </clef>
      </attributes>
      <note>
        <pitch>
          <step>C</step>
          <octave>4</octave>
        </pitch>
        <duration>4</duration>
        <type>whole</type>
      </note>
    </measure>
  </part>
</score-partwise>
"""
