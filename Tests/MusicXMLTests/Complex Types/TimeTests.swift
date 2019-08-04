//
//  TimeTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/4/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class TimeTests: XCTestCase {

    func testDecodingMeasured() throws {
        let xml = """
        <time>
            <beats>4</beats>
            <beat-type>4</beat-type>
        </time>
        """
        let decoded = try XMLDecoder().decode(Time.Measured.self, from: xml.data(using: .utf8)!)
        let expected = Time.Measured(
            signature: Time.Signature(beats: 4, beatType: 4),
            interchangeable: nil
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecodingCommon() throws {
        let xml = """
        <time symbol="common">
            <beats>4</beats>
            <beat-type>4</beat-type>
        </time>
        """
        let decoded = try XMLDecoder().decode(Time.self, from: xml.data(using: .utf8)!)
        let expected = Time(
            number: nil,
            symbol: TimeSymbol.common,
            separator: nil,
            printStyle: nil,
            hAlign: nil,
            vAlign: nil,
            printObject: nil,
            kind: Time.Kind.measured(
                Time.Measured(
                    signature: Time.Signature(beats: 4, beatType: 4),
                    interchangeable: nil
                )
            )
        )
        XCTAssertEqual(decoded, expected)
    }
}
