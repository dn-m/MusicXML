//
//  TipDirection.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The tip-direction type represents the direction in which the tip of a stick or beater points,
/// using Unicode arrow terminology.
public enum TipDirection: String {
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
}

extension TipDirection: Equatable { }
extension TipDirection: Codable { }
