//
//  Partwise_01_Pitches.swift
//  MusicXMLTests
//
//  Created by James Bean on 5/28/19.
//

import XCTest
import MusicXML

class Partwise_01_Pitches: XCTestCase {

    func testA_Pitches() throws {
        let musicXML = try MusicXML(string: A_Pitches)
        guard case let .partwise(partwise) = musicXML.score.traversal else { XCTFail(); return }
        for part in partwise.parts {
            for measure in part.measures {
                for datum in measure.musicData {
                    switch datum {
                    case let .note(note):
                        note.pitch.map { print($0) }
                        note.accidental.map { print($0.value) }
                    default:
                        break
                    }
                }
            }
        }
    }
}
