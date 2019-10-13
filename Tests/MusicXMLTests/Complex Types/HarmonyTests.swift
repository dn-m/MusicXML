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
        let decoded = try XMLDecoder().decode(Harmony.self, from: xml.data(using: .utf8)!)
        let expected: Harmony = Harmony(
            chords: [
                HarmonyChord(
                    rootOrFunction: .root(
                        Root(
                            step: RootStep(value: .f),
                            alter: RootAlter(value: 1)
                        )
                    ),
                    kind: Kind(value: .major),
                    inversion: Inversion(value: 2)
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
        let decoded = try XMLDecoder().decode(Harmony.self, from: xml.data(using: .utf8)!)
        let expected: Harmony = Harmony(
            chords: [
                HarmonyChord(
                    rootOrFunction: .root(
                        Root(
                            step: RootStep(value: .f),
                            alter: RootAlter(value: 1)
                        )
                    ),
                    kind: Kind(value: .major),
                    inversion: Inversion(value: 2),
                    bass: Bass(bassStep: BassStep(value: .d), bassAlter: 1.0),
                    degrees: [
                        Degree(
                            value: DegreeValue(value: 6),
                            alter: DegreeAlter(value: -1),
                            type: DegreeType(value: .add)
                        )
                    ]
                ),
                HarmonyChord(
                    rootOrFunction: .root(
                        Root(
                            step: RootStep(value: .c)
                        )
                    ),
                    kind: Kind(value: .neapolitan),
                    degrees: [
                        Degree(
                            value: DegreeValue(value: 3),
                            alter: DegreeAlter(value: 0),
                            type: DegreeType(value: .subtract)
                        ),
                        Degree(
                            value: DegreeValue(value: 5),
                            alter: DegreeAlter(value: -1),
                            type: DegreeType(value: .alter)
                        )
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
        let decoded = try XMLDecoder().decode(Harmony.self, from: xml.data(using: .utf8)!)
        let expected: Harmony = Harmony(
            printStyle: PrintStyle(
                position: Position(defaultY: 40)
            ),
            chords: [
                HarmonyChord(
                    rootOrFunction: .root(
                        Root(
                            step: RootStep(value: .a)
                        )
                    ),
                    kind: Kind(value: .minorSeventh),
                    bass: Bass(bassStep: BassStep(value: .g)),
                    degrees: [
                        Degree(
                            value: DegreeValue(value: 13),
                            alter: DegreeAlter(value: 1),
                            type: DegreeType(value: .add)
                        ),
                        Degree(
                            value: DegreeValue(value: 3),
                            alter: DegreeAlter(value: 0),
                            type: DegreeType(value: .subtract)
                        ),
                        Degree(
                            value: DegreeValue(value: 5),
                            alter: DegreeAlter(value: -1),
                            type: DegreeType(value: .alter)
                        )
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
        let decoded = try XMLDecoder().decode(Degree.self, from: xml.data(using: .utf8)!)
        let expected: Degree = Degree(
            value: DegreeValue(value: 13),
            alter: DegreeAlter(value: -1),
            type: DegreeType(value: .add)
        )
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
        let decoded = try XMLDecoder().decode(HarmonyChord.RootOrFunction.self, from: xml.data(using: .utf8)!)
        let expected: HarmonyChord.RootOrFunction = .root(
            Root(step: RootStep(value: .a))
        )
        XCTAssertEqual(decoded, expected)
    }
}
