//
//  ArrowTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 9/5/19.
//

import XCTest
import MusicXML

class ArrowTests: XCTestCase {

    func testAPI() {
        // Circular
        let _ = Arrow(direction: .anticlockwise)
        // Linear
        let _ = Arrow(direction: .northeastSouthwest, style: .hollow)
    }
}
