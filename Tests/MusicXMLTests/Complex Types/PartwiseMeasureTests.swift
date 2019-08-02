//
//  PartwiseMeasureTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class PartwiseMeasureTests: XCTestCase {

    func testDecodingEmpty() throws {
        let xml = """
            <measure number="1"></measure>
            """
        let decoded = try XMLDecoder()
            .decode(Score.Partwise.Measure.self, from: xml.data(using: .utf8)!)
        let expected = Score.Partwise.Measure(
            number: 1,
            text: nil,
            implicit: nil,
            nonControlling: nil,
            width: nil,
            optionalUniqueID: nil,
            musicData: nil
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecodingAttributes() throws {
        let xml = """
        <measure number="1">
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
        </measure>
        """
        let decoded = try XMLDecoder()
            .decode(Score.Partwise.Measure.self, from: xml.data(using: .utf8)!)
        #warning("Finish Score.Partwise.Measure attributes tests")
    }
}
