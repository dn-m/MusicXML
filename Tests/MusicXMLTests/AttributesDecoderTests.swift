//
//  AttributesDecoderTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

import XCTest
import XMLCoder
@testable import MusicXML

class AttributesDecoderTests: XCTestCase {

    func testTime() {
        let xml = """
        <time>
            <beats>4</beats>
            <beat-type>4</beat-type>
        </time>
        """
        XCTAssertNoThrow(try XMLDecoder().decode(Time.self, from: xml.data(using: .utf8)!))
    }

    func testKey() {
        let xml = """
        <key>
            <fifths>0</fifths>
        </key>
        """
        XCTAssertNoThrow(try XMLDecoder().decode(Key.self, from: xml.data(using: .utf8)!))
    }

    func testClef() {
        let xml = """
        <clef>
            <sign>G</sign>
            <line>2</line>
        </clef>
        """
        XCTAssertNoThrow(try XMLDecoder().decode(Clef.self, from: xml.data(using:. utf8)!))
    }

    func testAttributes() {
        let xml = """
        <attributes>
            <divisions>1</divisions>
            <time>
                <beats>4</beats>
                <beat-type>4</beat-type>
            </time>
            <key>
                <fifths>0</fifths>
                <clef>
                    <sign>G</sign>
                    <line>2</line>
                </clef>
            </key>
        </attributes>
        """
        let expected = Attributes(
            editorial: nil,
            divisions: 1,
            keys: [
                Key(
                    kind: .traditional(.init(fifths: 0, cancel: nil, mode: nil)),
                    number: nil,
                    octaves: nil,
                    id: nil
                )
            ],
            time: [
                Time(
                    kind: .measured(
                        .init(
                            signatures: [
                                .init(beats: 4, beatType: 4)
                            ],
                            interchangeable: nil
                        )
                    ),
                    symbol: .common,
                    separator: .horizontal,
                    id: nil
                )
            ],
            staves: nil,
            partSymbol: nil,
            instruments: nil,
            clefs: nil,
            staffDetails: nil,
            transpose: nil,
            directive: nil,
            measureStyles: nil
        )
        let attributes = try! XMLDecoder().decode(Attributes.self, from: xml.data(using: .utf8)!)
        XCTAssertEqual(attributes, expected)
    }
}
