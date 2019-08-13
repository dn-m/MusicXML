//
//  Partwise_21_Chords.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/13/19.
//

import XCTest
import MusicXML

class Partwise_21_Chords: XCTestCase {

    func test_21_Chords() throws {
        let _ = try MusicXML(string: A_Basic)
        let _ = try MusicXML(string: B_TwoNotes)
        let _ = try MusicXML(string: C_ThreeNotesDuration)
        let _ = try MusicXML(string: D_SchubertStabatMater)
        let _ = try MusicXML(string: E_PickupMeasures)
        let _ = try MusicXML(string: F_ElementInBetween)
    }
}