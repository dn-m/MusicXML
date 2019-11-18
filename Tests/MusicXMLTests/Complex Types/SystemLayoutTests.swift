//
//  SystemLayoutTests.swift
//  MusicXMLTests
//
//  Created by Sihao Lu on 11/17/19.
//

import XCTest
import XMLCoder
import MusicXML

class SystemLayoutTests: XCTestCase {

    func testDecoding() throws {
        let xml = """
        <system-layout>
          <system-margins>
            <left-margin>12</left-margin>
            <right-margin>23</right-margin>
          </system-margins>
          <system-distance>39</system-distance>
          <top-system-distance>10</top-system-distance>
          <system-dividers>
            <left-divider print-object="yes"/>
            <right-divider print-object="no"/>
          </system-dividers>
        </system-layout>
        """
        let decoded = try XMLDecoder().decode(SystemLayout.self, from: xml.data(using: .utf8)!)
        let expected = SystemLayout(margins: SystemMargins(left: 12, right: 23), distance: 39, topSystemDistance: 10, dividers: SystemDividers(left: PrintStyleAlignObject(printObject: true), right: PrintStyleAlignObject(printObject: false)))
        XCTAssertEqual(decoded, expected)
    }
}
