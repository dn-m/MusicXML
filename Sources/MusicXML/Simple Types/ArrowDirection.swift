//
//  ArrowDirection.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The arrow-direction type represents the direction in which an arrow points, using Unicode arrow
/// terminology.
public enum ArrowDirection: String {
    case left
    case up
    case right
    case down
    case northwest
    case northeast
    case southeast
    case southwest
    case leftRight = "left right"
    case upDown = "up down"
    case northwestSoutheast = "nothwest southeast"
    case northeastSouthwest = "northeast southwest"
    case other
}

extension ArrowDirection: Equatable { }
extension ArrowDirection: Codable { }
