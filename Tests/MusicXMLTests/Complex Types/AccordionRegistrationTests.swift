//
//  AccordionRegistrationTests.swift
//  MusicXMLTests
//
//  Created by Sihao Lu on 10/12/19.
//

import XCTest
import XMLCoder
import MusicXML

class AccordionRegistrationTests: XCTestCase {
    func testDecoding() throws {
        let xml = """
        <accordion-registration>
            <accordion-high/>
            <accordion-middle>2</accordion-middle>
        </accordion-registration>
        """
        let decoded = try MusicXMLDecoder().decode(AccordionRegistration.self, from: xml)
        let expected = AccordionRegistration(accordionHigh: Empty(), accordionMiddle: 2)
        XCTAssertEqual(decoded, expected)
    }
}
