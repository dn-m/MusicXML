//
//  PercussionTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import XCTest
import XMLCoder
import MusicXML

class PercussionTests: XCTestCase {

    func testOrnamentsEmpty() throws {
        let xml = """
        <notations>
          <tied type="stop"/>
          <ornaments/>
        </notations>
        """
        let decoded = try MusicXMLDecoder().decode(Notations.self, from: xml)
        let expected = Notations([
            .tied(Tied(type: .stop)),
            .ornaments(Ornaments())
        ])
        XCTAssertEqual(decoded, expected)
    }
}
