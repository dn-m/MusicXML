//
//  EndingTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/24/19.
//

import XCTest
import MusicXML

class EndingTests: XCTestCase {

    func testRoundTrip() throws {
        let ending = Ending("1.",
            number: "1",
            type: .start,
            printObject: false,
            printStyle: PrintStyle(position: Position(defaultX: 42))
        )
        try testRoundTrip(ending)
    }
}
