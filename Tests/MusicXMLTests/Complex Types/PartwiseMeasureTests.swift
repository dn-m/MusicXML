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
        let expected = Score.Partwise.Measure(
            number: 1,
            text: nil,
            implicit: nil,
            nonControlling: nil,
            width: nil,
            optionalUniqueID: nil,
            musicData: MusicData(
                values: [
                    .attributes(
                        Attributes(
                            footnote: nil,
                            level: nil,
                            divisions: 1,
                            keys: [
                                Key(
                                    number: nil,
                                    position: nil,
                                    printStyle: nil,
                                    printObject: nil,
                                    kind: .traditional(Key.Traditional(cancel: nil, fifths: 0, mode: .major)),
                                    keyOctave: nil
                                )
                            ],
                            times: [
                                Time(
                                    number: nil,
                                    symbol: .common,
                                    separator: nil,
                                    printStyle: nil,
                                    hAlign: nil,
                                    vAlign: nil,
                                    printObject: nil,
                                    kind: .measured(
                                        Time.Measured(
                                            signature: Time.Signature(beats: 4, beatType: 4),
                                            interchangeable: nil
                                        )
                                    )
                                )
                            ],
                            staves: nil,
                            partSymbol: nil,
                            instruments: nil,
                            clefs: [
                                Clef(
                                    number: nil,
                                    additional: nil,
                                    size: nil,
                                    afterBarline: nil,
                                    printStyle: nil,
                                    printObject: nil,
                                    sign: .g,
                                    line: 2,
                                    clefOctaveChange: nil
                                )
                            ],
                            staffDetails: nil,
                            transpose: nil,
                            measureStyles: nil
                        )
                    )
                ]
            )
        )
        XCTAssertEqual(decoded, expected)
    }
}
