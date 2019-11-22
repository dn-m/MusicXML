//
//  ArticulationsTextsTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import MusicXML
import XCTest
import XMLCoder

class ArticulationsTextsTests: XCTestCase {
    func testColorHex() throws {
        let xml = """
        <direction placement="below">
            <direction-type>
                <words default-x="1" default-y="-15" font-size="small" color="#FF8000">
                    Normal, Small, Colored, Below
                </words>
            </direction-type>
        </direction>
        """
        let decoded = try XMLDecoder().decode(Direction.self, from: xml.data(using: .utf8)!)
        let expected = Direction(
            [
                .words(
                    [
                        FormattedText("Normal, Small, Colored, Below",
                                      printStyle: PrintStyle(
                                          position: Position(defaultX: 1, defaultY: -15),
                                          font: Font(size: FontSize(.small)),
                                          color: Color(hexString: "#FF8000")
                                      )),
                    ]
                ),
            ],
            placement: .below
        )
        XCTAssertEqual(decoded, expected)
    }
}
