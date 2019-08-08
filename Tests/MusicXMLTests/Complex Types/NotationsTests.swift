//
//  NotationsTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class NotationsTests: XCTestCase {

    #warning("FIXME: #56 Notations.Notation.tuplet not decoding properly yet")
    func DISABLED_testTuplet() throws {
        let xml = """
        <notations>
          <tuplet number="1" type="start"/>
        </notations>
        """
        let decoded = try XMLDecoder().decode(Notations.self, from: xml.data(using: .utf8)!)
        let expected = Notations(values: [.tuplet(Tuplet(type: .start, number: 1))])
        XCTAssertEqual(decoded, expected)
    }
}
