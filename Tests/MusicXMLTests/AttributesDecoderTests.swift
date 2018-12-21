//
//  AttributesDecoderTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

import XCTest
import XMLCoder
import MusicXML

class AttributesDecoderTests: XCTestCase {

    func testTime() {
        let xml = """
        <time>
            <beats>4</beats>
            <beat-type>4</beat-type>
        </time>
        """
        XCTAssertNoThrow(
            try XMLDecoder().decode(MusicXML.Attributes.Time.self, from: xml.data(using: .utf8)!)
        )
    }

    func testKey() {
        let xml = """
        <key>
            <fifths>0</fifths>
        </key>
        """
        XCTAssertNoThrow(
            try XMLDecoder().decode(MusicXML.Attributes.Key.self, from: xml.data(using: .utf8)!)
        )
    }

    func testClef() {
        let xml = """
        <clef>
            <sign>G</sign>
            <line>2</line>
        </clef>
        """
        XCTAssertNoThrow(
            try XMLDecoder().decode(MusicXML.Attributes.Clef.self, from: xml.data(using:. utf8)!)
        )
    }
}
