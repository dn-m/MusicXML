//
//  MetronomeTests.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 10/6/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class MetronomeTests: XCTestCase {
    func testDecodingMetronome_regular() throws {
        let xml = """
        <metronome parentheses="no" default-x="-25.96" relative-y="20.00">
          <beat-unit>quarter</beat-unit>
          <per-minute>90</per-minute>
        </metronome>
        """

        let decoded = try XMLDecoder().decode(Metronome.self, from: xml.data(using: .utf8)!)
        let expected: Metronome = Metronome(
            position: Position(defaultX: -25.96, relativeY: 20.00),
            parentheses: false,
            kind: .regular(
                Metronome.Regular(
                    beatUnit: .quarter,
                    relation: .perMinute(
                        PerMinute(value: "90")
                    )
                )
            )
        )
        XCTAssertEqual(decoded, expected)
    }
}

