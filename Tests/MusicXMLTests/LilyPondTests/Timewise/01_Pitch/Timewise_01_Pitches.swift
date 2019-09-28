//
//  Timewise_01_Pitches.swift
//  MusicXMLTests
//
//  Created by James Bean on 5/28/19.
//

import XCTest
import MusicXML

class Timewise_01_Pitches: XCTestCase {

    func test_01_Pitches() throws {
        let _ = try MusicXML(testFileName: "01a-Pitches-Pitches", traversal: .timewise)
        let _ = try MusicXML(string: B_Intervals)
        let _ = try MusicXML(string: C_NoVoiceElement)
        let _ = try MusicXML(string: D_Microtones)
        let _ = try MusicXML(string: E_ParenthesizedAccidentals)
        let _ = try MusicXML(string: F_ParenthesizedMicrotoneAccidentals)
    }
}
