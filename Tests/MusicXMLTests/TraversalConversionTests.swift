//
//  TraversalConversionTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/15/19.
//

import XCTest
import MusicXML

class TraversalConversionTests: XCTestCase {

    func testHelloWorldRoundTrip() throws {
        // Shared values
        let note = Note(pitch: Pitch(step: .c, octave: 4), duration: 4, type: .whole)
        let attributes = Attributes(
            divisions: 1,
            keys: [Key(fifths: 0)],
            times: [Time(4,4)],
            clefs: [Clef(sign: .g, line: 2)]
        )
        let header = Header(
            partList: [
                .part(ScorePart(id: "P1", name: "Music"))
            ]
        )
        // Create `Partwise` traversal
        let partwiseMeasure = Partwise.Measure(
            number: "1",
            musicData: [
                .attributes(attributes),
                .note(note)
            ]
        )
        let partwisePart = Partwise.Part(id: "P1", measures: [partwiseMeasure])
        let partwise = Partwise(header: header, parts: [partwisePart])
        // Create `Timewise` traversal
        let timewisePart = Timewise.Part(
            id: "P1",
            musicData: [
                .attributes(attributes),
                .note(note)
            ]
        )
        let timewiseMeasure = Timewise.Measure(number: "1", parts: [timewisePart])
        let timewise = Timewise(header: header, measures: [timewiseMeasure])
        XCTAssertEqual(timewise.toPartwise().toTimewise(), timewise)
        XCTAssertEqual(partwise.toTimewise().toPartwise(), partwise)
    }
}
