//
//  IdentificationTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
import MusicXML

class IdentificationTests: XCTestCase {

    func testDecodingSimple() throws {
        let xml = """
        <identification>
            <miscellaneous>
              <miscellaneous-field name="description">Here is some text.</miscellaneous-field>
            </miscellaneous>
        </identification>
        """
        let decoded = try XMLDecoder().decode(Identification.self, from: xml.data(using: .utf8)!)
        let expected = Identification(
            miscellaneous: Miscellaneous(
                fields: [
                    MiscellaneousField("Here is some text.", name: "description"),
                ]
            )
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecoding() throws {
        let xml = """
        <identification>
            <creator type="composer">Franz Schubert</creator>
            <creator type="poet">Wilhelm Müller</creator>
            <rights>Copyright 2001 Recordare LLC</rights>
            <encoding>
                <encoding-date>2002-02-16</encoding-date>
                <encoder>Michael Good</encoder>
                <software>Finale 2002 for Windows</software>
                <encoding-description>MusicXML 1.0 example</encoding-description>
            </encoding>
            <source>Based on Breitkopf and Härtel edition of 1895</source>
        </identification>
        """
        let decoded = try XMLDecoder().decode(Identification.self, from: xml.data(using: .utf8)!)
        let expected = Identification(
            creators: [
                Creator("Franz Schubert", type: "composer"),
                Creator("Wilhelm Müller", type: "poet"),
            ],
            rights: [
                Rights("Copyright 2001 Recordare LLC")
            ],
            encoding: Encoding(
                values: [
                    .date("2002-02-16"),
                    .encoder("Michael Good"),
                    .software("Finale 2002 for Windows"),
                    .description("MusicXML 1.0 example")
                ]
            ),
            source: "Based on Breitkopf and Härtel edition of 1895"
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecoding_supports() throws {
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
        let decoded = try XMLDecoder(trimValueWhitespaces: false).decode(Identification.self, from: xml.data(using: .utf8)!)
        let expected = Identification(
            creators: [
                Creator("Gabriel Fauré", type: "composer")
            ],
            rights: [
                Rights("Copyright © 2002 MakeMusic, Inc.")
            ],
            encoding: Encoding(
                values: [
                    .software("Finale v25 for Mac"),
                    .date("2017-12-15"),
                    .supports(Supports(type: true, element: "print", attribute: "new-system", value: "yes")),
                    .supports(Supports(type: true, element: "print", attribute: "new-page", value: "yes")),
                    .supports(Supports(type: true, element: "accidental")),
                    .supports(Supports(type: true, element: "beam")),
                    .supports(Supports(type: true, element: "stem"))
                ]
            )
        )
        XCTAssertEqual(decoded, expected)
    }
}
