//
//  NotationTests.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 10/2/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class NotationTests: XCTestCase {
    func testDecoding() throws {
        let xml = """
        <notations>
            <tied type="start"/>
        </notations>
        """
        let decoded = try XMLDecoder().decode(Notations.self, from: xml.data(using: .utf8)!)
        let expected = Notations(values: [
            .tied(Tied(type: .start))
        ])

        XCTAssertEqual(decoded, expected)
    }
}
