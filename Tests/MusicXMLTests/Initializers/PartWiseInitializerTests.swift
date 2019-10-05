//
//  PartWiseInitializerTests.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 10/3/19.
//

import XCTest
// Do not use @testable
import MusicXML

class PartWiseInitializerTests: XCTestCase {
    func testPartWise() {
        _ = Partwise.Measure(
            number: 2,
            width: 474.15,
            musicData: [
                .attributes(
                    Attributes(
                        divisions: 4,
                        keys: [Key(fifths: 2)],
                        times: [Time(4, 4)],
                        clefs: [Clef(sign: .g, line: 2)]
                    )
                ),
                .direction(
                    Direction(
                        placement: .above,
                        directive: nil,
                        directionType: .metronome(
                            Metronome(
                                kind: .regular(
                                    Metronome.Regular(
                                        beatUnit: .quarter,
                                        beatUnitDot: [],
                                        relation: .perMinute(
                                            PerMinute(value: "90", font: nil)
                                        )
                                    )
                                )
                            )
                        )
                    )
                ),
                .note(
                  Note(
                    kind: .normal(
                      Note.Normal(
                        pitchUnpitchedOrRest: .rest(Rest()),
                        duration: 4
                      )
                    ),
                    voice: "1",
                    type: NoteType(value: .quarter)
                  )
                ),
                .note(
                    Note(
                        kind: .normal(
                            Note.Normal(
                                pitchUnpitchedOrRest: .pitch(
                                    Pitch(step: .d, alter: nil, octave: 4)
                                ),
                                duration: 8
                            )
                        ),
                        position: Position(defaultX: 10, defaultY: -45),
                        voice: "1",
                        type: NoteType(value: .half),
                        stem: Stem(value: .up)
                    )
                ),
            ]
        )
    }
}
