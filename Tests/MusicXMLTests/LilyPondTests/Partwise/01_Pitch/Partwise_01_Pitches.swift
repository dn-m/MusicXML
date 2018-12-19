//
//  Partwise_01_Pitches.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

import Foundation
import XCTest
import MusicXML

class Partwise_01_Pitches: XCTestCase {

    func testA_Pitches() {
        let musicXML = try! MusicXML(string: A_Pitches)
        dump(musicXML)
        XCTAssertNoThrow(try MusicXML(string: A_Pitches))
    }

    func testB_Intervals() {
        XCTAssertNoThrow(try MusicXML(string: B_Intervals))
    }

    func testC_NoVoiceElement() {
        XCTAssertNoThrow(try MusicXML(string: C_NoVoiceElement))
    }

    func testD_Microtones() {
        XCTAssertNoThrow(try MusicXML(string: D_Microtones))
    }

    func testE_ParenthesizedAccidentals() {
        let musicXML = try! MusicXML(string: E_ParenthesizedAccidentals)
        dump(musicXML)
        XCTAssertNoThrow(try MusicXML(string: E_ParenthesizedAccidentals))
    }

    func testF_ParenthesizedMicrotoneAccidentals() {
        XCTAssertNoThrow(try MusicXML(string: F_ParenthesizedMicrotoneAccidentals))
    }
}
