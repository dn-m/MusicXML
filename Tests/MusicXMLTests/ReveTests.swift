//
//  ReveTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/16/19.
//

import XCTest
import XMLCoder
import MusicXML

class ReveTests: XCTestCase {

    func testIdentification() throws {
        let xml = """
        <identification>
          <creator type="composer">Gabriel Fauré</creator>
          <rights>Copyright © 2002 MakeMusic, Inc.</rights>
          <encoding>
            <software>Finale v25 for Mac</software>
            <encoding-date>2017-12-15</encoding-date>
            <supports attribute="new-system" element="print" type="yes" value="yes"/>
            <supports attribute="new-page" element="print" type="yes" value="yes"/>
            <supports element="accidental" type="yes"/>
            <supports element="beam" type="yes"/>
            <supports element="stem" type="yes"/>
          </encoding>
        </identification>
        """
        let decoded = try XMLDecoder().decode(Identification.self, from: xml.data(using: .utf8)!)
        let expected = Identification(
            creators: [Creator("Gabriel Fauré", type: "composer")],
            rights: [Rights("Copyright © 2002 MakeMusic, Inc.")],
            encoding: Encoding([
                .software("Finale v25 for Mac"),
                .date("2017-12-15"),
                .supports(
                    Supports(attribute: "new-system", element: "print", type: true, value: "yes")
                ),
                .supports(
                    Supports(attribute: "new-page", element: "print", type: true, value: "yes")
                ),
                .supports(Supports(element: "accidental", type: true)),
                .supports(Supports(element: "beam", type: true)),
                .supports(Supports(element: "stem", type: true))
            ])
        )
        XCTAssertEqual(decoded, expected)
    }

    func testRights() throws {
        let xml = """
        <rights>Copyright © 2002 MakeMusic, Inc.</rights>
        """
        let decoded = try XMLDecoder().decode(Rights.self, from: xml.data(using: .utf8)!)
        let expected = Rights("Copyright © 2002 MakeMusic, Inc.")
        XCTAssertEqual(decoded, expected)
    }

    func testEncoding() throws {
        let xml = """
        <encoding>
          <software>Finale v25 for Mac</software>
          <encoding-date>2017-12-15</encoding-date>
          <supports attribute="new-system" element="print" type="yes" value="yes"/>
          <supports attribute="new-page" element="print" type="yes" value="yes"/>
          <supports element="accidental" type="yes"/>
          <supports element="beam" type="yes"/>
          <supports element="stem" type="yes"/>
        </encoding>
        """
        let decoded = try XMLDecoder().decode(Encoding.self, from: xml.data(using: .utf8)!)
        let expected = Encoding([
            .software("Finale v25 for Mac"),
            .date("2017-12-15"),
            .supports(
                Supports(attribute: "new-system", element: "print", type: true, value: "yes")
            ),
            .supports(Supports(attribute: "new-page", element: "print", type: true, value: "yes")),
            .supports(Supports(element: "accidental", type: true)),
            .supports(Supports(element: "beam", type: true)),
            .supports(Supports(element: "stem", type: true))
        ])
        XCTAssertEqual(decoded, expected)
    }

    func testSupportsAttributeElementTypeValue() throws {
        let xml = """
        <supports attribute="new-system" element="print" type="yes" value="yes"/>
        """
        let decoded = try XMLDecoder().decode(Supports.self, from: xml.data(using: .utf8)!)
        let expected = Supports(
            attribute: "new-system",
            element: "print",
            type: true,
            value: "yes"
        )
        XCTAssertEqual(decoded, expected)
    }

    func testSupportsElementType() throws {
        let xml = """
        <supports element="beam" type="yes"/>
        """
        let expected = Supports(element: "beam", type: true)
        let decoded = try XMLDecoder().decode(Supports.self, from: xml.data(using: .utf8)!)
        XCTAssertEqual(decoded, expected)
    }
}
