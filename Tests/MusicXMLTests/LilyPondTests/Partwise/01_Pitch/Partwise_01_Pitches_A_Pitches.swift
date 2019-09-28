//
//  Partwise_01_Pitches_A_Pitches.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

extension Partwise_01_Pitches {
    var A_Pitches: String {
        return try! LilyPondTestSuite.string(testName: "01a-Pitches-Pitches", traversal: .partwise)
    }
}
