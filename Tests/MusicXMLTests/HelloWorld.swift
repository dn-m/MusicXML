//
//  HelloWorld.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/9/19.
//

import XCTest
import MusicXML

class HelloWorld: XCTestCase {

    func testHelloWorldDecoding() throws {
        let xml = """
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
        let decoded = try MusicXML(string: xml)

        // Create the note
        let note = Note(pitch: Pitch(step: .c, octave: 4), duration: 4, type: .whole)
        // Create measure attributes
        let attributes = Attributes(
            divisions: 1,
            keys: [Key(fifths: 0)],
            times: [Time(4,4)],
            clefs: [Clef(sign: .g, line: 2)]
        )
        // Create the measure
        let measure = Partwise.Measure(
            number: "1",
            musicData: [
                .attributes(attributes),
                .note(note)
            ]
        )
        // Create the part
        let part = Partwise.Part(id: "P1", measures: [measure])
        // Create the score header
        let header = Header(partList: PartList([.part(ScorePart(id: "P1", name: "Music"))]))
        // Create the traversal
        let traversal = Partwise(header: header, parts: [part])
        // Create the score
        let score = Score(traversal: .partwise(traversal))
        // Create the MusicXML
        let musicXML = MusicXML(score)

        XCTAssertEqual(decoded, musicXML)
    }
}
