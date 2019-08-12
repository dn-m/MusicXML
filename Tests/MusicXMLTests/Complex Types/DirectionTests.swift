//
//  DirectionTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/12/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class DirectionTests: XCTestCase {

    func testDirectionType() throws {
        let xml = """
        <direction-type>
          <octave-shift size="15" type="down"/>
        </direction-type>
        """
        let expected = DirectionType.octaveShift(OctaveShift(type: .down, size: 15))
        try assertDecoded(xml, equals: expected)
    }

    #warning("FIXME: #56 Notations.Notation.tuplet not decoding properly yet")
    func DISABLED_testDirectionTypeAndOffset() throws {
        let xml = """
        <direction>
          <direction-type>
            <octave-shift size="15" type="down"/>
          </direction-type>
          <offset>-4</offset>
        </direction>
        """
        let expected = Direction(
            types: [.octaveShift(OctaveShift(type: .down, size: 15))],
            offset: Offset(value: -4)
        )
        try assertDecoded(xml, equals: expected)
    }
}
