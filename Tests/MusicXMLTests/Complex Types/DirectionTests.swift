//
//  MusicDataTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class DirectionTests: XCTestCase {
    func testDecodingDirection_metronome() throws {
        let xml = """
        <direction placement="above">
          <direction-type>
            <metronome parentheses="no" default-x="-25.96" relative-y="20.00">
              <beat-unit>quarter</beat-unit>
              <per-minute>90</per-minute>
            </metronome>
          </direction-type>
          <sound tempo="90"/>
        </direction>
        """

        let decoded = try XMLDecoder().decode(Direction.self, from: xml.data(using: .utf8)!)
        let expected: Direction = Direction(
            placement: .above,
            directionType: .metronome(
                Metronome(
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
            ),
            sound: Sound(
                tempo: 90
            )
        )
        XCTAssertEqual(decoded, expected)
    }
}
