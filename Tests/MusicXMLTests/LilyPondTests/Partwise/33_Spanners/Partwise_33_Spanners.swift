//
//  Partwise_33_Spanners.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/11/19.
//

import XCTest
import MusicXML

class Partwise_33_Spanners: XCTestCase {

    func test_33_Spanners() throws {
        let _ = try MusicXML(string: A)
        let _ = try MusicXML(string: B_Tie)
        let _ = try MusicXML(string: C_Slurs)
        let _ = try MusicXML(string: D_OctaveShifts)
        let _ = try MusicXML(string: E_OctaveShifts_InvalidSize)
        let _ = try MusicXML(string: F_Trill_EndingOnGraceNote)
        let _ = try MusicXML(string: G_Slur_ChordedNotes)
        let _ = try MusicXML(string: H_Glissando)
        let _ = try MusicXML(string: I_Ties_NotEnded)
    }
}
