//
//  Timewise_03_Rhythm.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import MusicXML

class Timewise_03_Rhythm: XCTestCase {

    func test_03_Rhythm() throws {
        let _ = try MusicXML(string: A_Durations)
        let _ = try MusicXML(string: B_Backup)
        let _ = try MusicXML(string: C_DivisionChange)
        let _ = try MusicXML(string: D_DottedDurations_Factors)
    }
}
