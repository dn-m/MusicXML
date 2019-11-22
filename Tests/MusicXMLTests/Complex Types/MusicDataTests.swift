//
//  MusicDataTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import MusicXML
import XCTest
import XMLCoder

class MusicDataTests: XCTestCase {
    func testDecodingDivisions() throws {
        let xml = """
        <attributes>
          <divisions>1</divisions>
        </attributes>
        """
        let decoded = try XMLDecoder().decode(Attributes.self, from: xml.data(using: .utf8)!)
        let expected = Attributes(divisions: 1)
        XCTAssertEqual(decoded, expected)
    }

    func testDecodingAttributes() throws {
        let xml = """
        <music-data>
          <attributes>
            <divisions>1</divisions>
            <key>
              <fifths>0</fifths>
              <mode>major</mode>
            </key>
            <time symbol="common">
              <beats>4</beats>
              <beat-type>4</beat-type>
            </time>
            <clef>
              <sign>G</sign>
              <line>2</line>
            </clef>
          </attributes>
        </music-data>
        """
        let decoded = try XMLDecoder().decode([MusicData].self, from: xml.data(using: .utf8)!)
        let expected: [MusicData] = [
            .attributes(
                Attributes(
                    divisions: 1,
                    keys: [
                        Key(
                            kind: .traditional(Key.Traditional(fifths: 0, mode: .major))
                        ),
                    ],
                    times: [Time(4, 4, symbol: .common)],
                    clefs: [Clef(sign: .g, line: 2)]
                )
            ),
        ]
        XCTAssertEqual(decoded, expected)
    }
}
