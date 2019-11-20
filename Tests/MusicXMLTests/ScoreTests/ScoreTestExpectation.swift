//
//  ScoreTestExpectation.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 10/13/19.
//

import MusicXML
import XCTest

protocol ScoreTestExpectation: AnyObject {
    static var expected: Score { get }
}
