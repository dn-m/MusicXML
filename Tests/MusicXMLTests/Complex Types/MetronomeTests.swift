//
//  MetronomeTests.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 10/6/19.
//

import XCTest
import XMLCoder
import MusicXML

class MetronomeTests: XCTestCase {
    func testDecodingMetronome_perMinute() throws {
        let xml = """
        <metronome parentheses="no" default-x="-25.96" relative-y="20.00">
          <beat-unit>quarter</beat-unit>
          <per-minute>90</per-minute>
        </metronome>
        """

        let decoded = try MusicXMLDecoder().decode(Metronome.self, from: xml.data(using: .utf8)!)
        let expected: Metronome = Metronome(
            position: Position(defaultX: -25.96, relativeY: 20.00),
            parentheses: false,
            kind: .regular(
                Metronome.Regular(
                    beatUnit: .quarter,
                    relation: .perMinute(PerMinute("90"))
                )
            )
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecodingMetronome_perMinute_withDot() throws {
        let xml = """
        <metronome parentheses="yes">
          <beat-unit>quarter</beat-unit>
          <beat-unit-dot/>
          <per-minute>77</per-minute>
        </metronome>
        """

        let decoded = try MusicXMLDecoder().decode(Metronome.self, from: xml.data(using: .utf8)!)
        let expected: Metronome = Metronome(
            parentheses: true,
            kind: .regular(
                Metronome.Regular(
                    beatUnit: .quarter,
                    beatUnitDot: [Empty()],
                    relation: .perMinute(PerMinute("77"))
                )
            )
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecodingMetronome_beatUnit() throws {
        let xml = """
        <metronome>
          <beat-unit>quarter</beat-unit>
          <beat-unit-dot/>
          <beat-unit>half</beat-unit>
          <beat-unit-dot/>
        </metronome>
        """

        let decoded = try MusicXMLDecoder().decode(Metronome.self, from: xml.data(using: .utf8)!)
        let expected: Metronome = Metronome(
            kind: .regular(
                Metronome.Regular(
                    beatUnit: .quarter,
                    beatUnitDot: [Empty()],
                    relation: .beatUnit(.half, [Empty()])
                )
            )
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecodingMetronome_noBeatUnitInFirst() throws {
        let xml = """
        <metronome parentheses="yes">
          <beat-unit>long</beat-unit>
          <beat-unit>32nd</beat-unit>
          <beat-unit-dot/>
        </metronome>
        """

        let decoded = try MusicXMLDecoder().decode(Metronome.self, from: xml.data(using: .utf8)!)
        let expected: Metronome = Metronome(
            parentheses: true,
            kind: .regular(
                Metronome.Regular(
                    beatUnit: .long,
                    relation: .beatUnit(.thirysecond, [Empty()])
                )
            )
        )
        XCTAssertEqual(decoded, expected)
    }
}

