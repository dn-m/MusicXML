//
//  StaffNoteStylesTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/11/19.
//

import XCTest
import MusicXML
import XMLCoder

class StaffNoteStylesTests: XCTestCase {

    func testMeasureStylesAttributes() throws {
        let xml = """
        <attributes>
            <measure-style>
                <slash type="start" use-stems="no"/>
            </measure-style>
        </attributes>
        """
        let decoded = try XMLDecoder().decode(Attributes.self, from: xml.data(using: .utf8)!)
        let expected = Attributes(measureStyles: [
            MeasureStyle(kind: .slash(Slash(type: .start, useStems: false)))
        ])
        XCTAssertEqual(decoded, expected)
    }

    func testMeasureStyles() throws {
        let xml = """
        <measure-style>
            <slash type="start" use-stems="no"/>
        </measure-style>
        """
        let decoded = try XMLDecoder().decode(MeasureStyle.self, from: xml.data(using: .utf8)!)
        let expected = MeasureStyle(kind: .slash(Slash(type: .start, useStems: false)))
        XCTAssertEqual(decoded, expected)
    }

    func testSlash() throws {
        let xml = """
        <slash type="start" use-stems="no"/>
        """
        let decoded = try XMLDecoder().decode(Slash.self, from: xml.data(using: .utf8)!)
        let expected = Slash(type: .start, useStems: false)
        XCTAssertEqual(decoded, expected)
    }
}
