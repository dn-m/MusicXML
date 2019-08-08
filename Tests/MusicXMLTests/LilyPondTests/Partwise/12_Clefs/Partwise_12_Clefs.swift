//
//  Partwise_12_Clefs.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import MusicXML

class Partwise_12_Clefs: XCTestCase {

    func test_12_Clefs() throws {
        let _ = try MusicXML(string: A_Clefs)

        do {
            let noKeyOrClef = try MusicXML(string: B_NoKeyOrClef)
        } catch {
            debugPrint(error)
            throw error
        }

    }
}
