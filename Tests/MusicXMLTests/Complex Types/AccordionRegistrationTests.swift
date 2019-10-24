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
        let decoded = try XMLDecoder().decode(AccordionRegistration.self, from: xml.data(using: .utf8)!)
        let expected = AccordionRegistration(high: true, middle: 2)
        XCTAssertEqual(decoded, expected)
    }
}
