//
//  ArrowTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 9/5/19.
//

import MusicXML
import XCTest

class ArrowTests: XCTestCase {
    func testAPI() {
        // Circular
        _ = Arrow(direction: .anticlockwise)
        // Linear
        _ = Arrow(direction: .northeastSouthwest, style: .hollow)
    }
}
