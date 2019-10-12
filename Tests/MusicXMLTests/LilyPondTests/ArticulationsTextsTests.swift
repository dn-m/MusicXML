//
//  ArticulationsTextsTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import XCTest
import MusicXML
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
        let _ = try XMLDecoder().decode(Direction.self, from: xml.data(using: .utf8)!)
    }
}
