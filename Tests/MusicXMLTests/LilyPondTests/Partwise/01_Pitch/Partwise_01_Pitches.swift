//
//  Partwise_01_Pitches.swift
//  MusicXMLTests
//
//  Created by James Bean on 5/28/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class Partwise_01_Pitches: XCTestCase {

    func testA_Pitches() throws {
        let decoded = try! XMLDecoder().decode(Score.Partwise.self, from: A_Pitches.data(using: .utf8)!)
        dump(decoded)
        for part in decoded.parts {
            for measure in part.measures {
                measure.musicData
            }
        }
    }
}
