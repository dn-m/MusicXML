//
//  ClefTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import MusicXML
import XCTest
import XMLCoder

class ClefTests: XCTestCase {
    func testSimple() throws {
        let xml = """
        <clef>
           <sign>F</sign>
           <line>4</line>
        </clef>
        """
        try assertDecoded(xml, equals: Clef(sign: .f, line: 4))
    }

    func testPercussion() throws {
        let xml = """
        <clef>
           <sign>percussion</sign>
        </clef>
        """
        try assertDecoded(xml, equals: Clef(sign: .percussion))
    }

    func testOctaveChange() throws {
        let xml = """
        <clef>
           <sign>G</sign>
           <line>2</line>
           <clef-octave-change>-1</clef-octave-change>
        </clef>
        """
        try assertDecoded(xml, equals: Clef(sign: .g, line: 2, clefOctaveChange: -1))
    }

    func testTAB() throws {
        let xml = """
        <clef>
            <sign>TAB</sign>
            <line>5</line>
        </clef>
        """
        try assertDecoded(xml, equals: Clef(sign: .TAB, line: 5))
    }

    func testNoSign() throws {
        let xml = """
        <clef>
           <sign>none</sign>
        </clef>
        """
        try assertDecoded(xml, equals: Clef(sign: .none))
    }
}
