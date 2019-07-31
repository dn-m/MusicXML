//
//  SemiPitched.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The semi-pitched type represents categories of indefinite pitch for percussion instruments.
public enum SemiPitched: String {
    case high
    case mediumHigh = "medium-height"
    case medium
    case mediumLow = "medium-low"
    case low
    case veryLow = "very-low"
}

extension SemiPitched: Equatable { }
extension SemiPitched: Codable { }
