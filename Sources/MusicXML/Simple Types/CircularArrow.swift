//
//  CircularArrow.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The circular-arrow type represents the direction in which a circular arrow points, using Unicode
/// arrow terminology.
public enum CircularArrow: String {
    case clockwise
    case anticlockwise
}

extension CircularArrow: Equatable {}
extension CircularArrow: Codable {}
