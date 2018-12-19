//
//  IdentificationDecoderTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/18/18.
//

import XCTest
import XMLCoder
import MusicXML

class IdentificationDecoderTests: XCTestCase {

    func testIdentificationMiscellaneousField() {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <identification>
            <miscellaneous>
              <miscellaneous-field name="description">All pitches from G to c'''' in
                  ascending steps; First without accidentals, then with a sharp and then
                  with a flat accidental, then with explicit natural accidentals.
                  Double alterations and cautionary accidentals
                  are tested at the end.</miscellaneous-field>
              <miscellaneous-field name="description">All pitches from G to c'''' in
                  ascending steps; First without accidentals, then with a sharp and then
                  with a flat accidental, then with explicit natural accidentals.
                  Double alterations and cautionary accidentals
                  are tested at the end.</miscellaneous-field>
            </miscellaneous>
        </identification>
        """
        XCTAssertNoThrow(
            try XMLDecoder().decode(MusicXML.Identification.self, from: xml.data(using: .utf8)!)
        )
    }
}
