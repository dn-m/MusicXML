//
//  BeamTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/13/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class BeamTests: XCTestCase {

    func testBeamDecoding() throws {
        let xml = """
        <beam number="1">begin</beam>
        """
        try assertDecoded(xml, equals: Beam(value: .begin, number: 1))
    }
}
