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
}
