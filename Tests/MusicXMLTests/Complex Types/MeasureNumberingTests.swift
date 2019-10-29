//
//  MeasureNumberingTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/24/19.
//

import XCTest
import MusicXML

class MeasureNumberingTests: XCTestCase {
    
    func testRoundTrip() throws {
        let numbering = MeasureNumbering(.system,
            printStyleAlign: PrintStyleAlign(
                printStyle: PrintStyle(
                    position: Position(
                        defaultX: 100,
                        defaultY: -100,
                        relativeX: 25,
                        relativeY: -25
                    ),
                    font: Font(weight: .bold),
                    color: Color(hexValue: 0x000000)),
                hAlign: .left,
                vAlign: .bottom
            )
        )
        try testRoundTrip(numbering)
    }
}
