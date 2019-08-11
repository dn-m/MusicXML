//
//  Timewise_11_TimeSignatures.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/11/19.
//

import XCTest
import MusicXML

class Timewise_11_TimeSignatures: XCTestCase {

    func test_11_TimeSignatures() throws {
        let _ = try MusicXML(string: A)
        let _ = try MusicXML(string: B_NoTime)
        let _ = try MusicXML(string: C_CompoundSimple)
        let _ = try MusicXML(string: D_CompoundMultiple)
        let _ = try MusicXML(string: E_CompoundMixed)
        let _ = try MusicXML(string: F_SymbolMeaning)
        let _ = try MusicXML(string: G_SingleNumber)
        let _ = try MusicXML(string: H_SenzaMisura)
    }
}
