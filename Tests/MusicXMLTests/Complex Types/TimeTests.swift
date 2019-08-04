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
                    signatures: [Time.Measured.Signature(beats: 4, beatType: 4)],
                    interchangeable: nil
                )
            )
        )
    }
}
