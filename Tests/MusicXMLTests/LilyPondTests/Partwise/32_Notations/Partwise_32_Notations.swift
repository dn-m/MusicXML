//
//  Partwise_32_Notations.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/9/19.
//

import XCTest
import MusicXML

class Partwise_32_Notations: XCTestCase {

    #warning("FIXME: #56 Notations.Notation.tuplet not decoding properly yet")
    #warning("FIXME: #41 Note.dots not decoding properly yet")
    func DISABLED_test_32_Notations() throws {
        let _ = try MusicXML(string: A)
    }
}
