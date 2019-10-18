//
//  HarmonyTests.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 10/8/19.
//

import XCTest
import XMLCoder
import MusicXML

class HarmonyTests: XCTestCase {
    func testDecoding_inversion() throws {
        let xml = """
        <harmony>
          <root>
            <root-step>F</root-step>
            <root-alter>1</root-alter>
          </root>
          <kind>major</kind>
          <inversion>2</inversion>
        </harmony>
        """
        let decoded = try MusicXMLDecoder().decode(Harmony.self, from: xml.data(using: .utf8)!)
        let expected: Harmony = Harmony(
            chords: [
                HarmonyChord(
                    rootOrFunction: .root(Root(step: .f, alter: 1)),
                    kind: .major,
                    inversion: 2
                )
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecoding_multipleHarmonyChord() throws {
        let xml = """
        <harmony>
          <root>
            <root-step>F</root-step>
            <root-alter>1</root-alter>
          </root>
          <kind>major</kind>
          <inversion>2</inversion>
          <bass>
            <bass-step>D</bass-step>
            <bass-alter>1</bass-alter>
          </bass>
          <degree>
            <degree-value>6</degree-value>
            <degree-alter>-1</degree-alter>
            <degree-type>add</degree-type>
          </degree>
          <root>
            <root-step>C</root-step>
          </root>
          <kind>Neapolitan</kind>
          <degree>
            <degree-value>3</degree-value>
            <degree-alter>0</degree-alter>
            <degree-type>subtract</degree-type>
          </degree>
          <degree>
            <degree-value>5</degree-value>
            <degree-alter>-1</degree-alter>
            <degree-type>alter</degree-type>
          </degree>
        </harmony>
        """
        let decoded = try MusicXMLDecoder().decode(Harmony.self, from: xml.data(using: .utf8)!)
        let expected: Harmony = Harmony(
            chords: [
                HarmonyChord(
                    rootOrFunction: .root(Root(step: .f, alter: 1)),
                    kind: .major,
                    inversion: 2,
                    bass: Bass(step: .d, alter: 1.0),
                    degrees: [
                        Degree(6, alter: -1, type: .add)
                    ]
                ),
                HarmonyChord(
                    rootOrFunction: .root(Root(step: .c)),
                    kind: Kind(.neapolitan),
                    degrees: [
                        Degree(3, alter: 0, type: .subtract),
                        Degree(5, alter: -1, type: .alter)
                    ]
                )
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecoding_degreesAndBass() throws {
        let xml = """
        <harmony default-y="40">
          <root>
            <root-step>A</root-step>
          </root>
          <kind>minor-seventh</kind>
          <bass>
            <bass-step>G</bass-step>
          </bass>
          <degree>
            <degree-value>13</degree-value>
            <degree-alter>1</degree-alter>
            <degree-type>add</degree-type>
          </degree>
          <degree>
            <degree-value>3</degree-value>
            <degree-alter>0</degree-alter>
            <degree-type>subtract</degree-type>
          </degree>
          <degree>
            <degree-value>5</degree-value>
            <degree-alter>-1</degree-alter>
            <degree-type>alter</degree-type>
          </degree>
        </harmony>
        """
        let decoded = try MusicXMLDecoder().decode(Harmony.self, from: xml.data(using: .utf8)!)
        let expected: Harmony = Harmony(
            printStyle: PrintStyle(position: Position(defaultY: 40)),
            chords: [
                HarmonyChord(
                    rootOrFunction: .root(Root(step: .a)),
                    kind: Kind(.minorSeventh),
                    bass: Bass(step: .g),
                    degrees: [
                        Degree(13, alter: 1, type: .add),
                        Degree(3, alter: 0, type: .subtract),
                        Degree(5, alter: -1, type: .alter)
                    ]
                )
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecoding_degree() throws {
        let xml = """
        <degree>
          <degree-value>13</degree-value>
          <degree-alter>-1</degree-alter>
          <degree-type>add</degree-type>
        </degree>
        """
        let decoded = try MusicXMLDecoder().decode(Degree.self, from: xml.data(using: .utf8)!)
        let expected: Degree = Degree(13, alter: -1, type: .add)
        XCTAssertEqual(decoded, expected)
    }

    func testDecoding_rootOrFunction() throws {
        let xml = """
        <wrapper>
            <root>
              <root-step>A</root-step>
            </root>
        </wrapper>
        """
        let decoded = try MusicXMLDecoder().decode(HarmonyChord.RootOrFunction.self, from: xml.data(using: .utf8)!)
        let expected: HarmonyChord.RootOrFunction = .root(Root(step: .a))
        XCTAssertEqual(decoded, expected)
    }
}
