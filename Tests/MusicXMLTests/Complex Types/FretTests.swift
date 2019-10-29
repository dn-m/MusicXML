//
//  FretTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/24/19.
//

import XCTest
import MusicXML

class FretTests: XCTestCase {

    func testRoundTrip() throws {
        let fret = Fret(3,
            color: Color(hexValue: 0xFFFFFF),
            font: Font(style: .italic, weight: .bold)
        )
        try testRoundTrip(fret, loggingEncoded: true)
    }
}
