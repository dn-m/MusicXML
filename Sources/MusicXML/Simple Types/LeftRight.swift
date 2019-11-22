//
//  LeftRight.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The left-right type is used to indicate whether one element appears to the left or the right of another element.
public enum LeftRight: String {
    case left
    case right
}

extension LeftRight: Equatable {}
extension LeftRight: Codable {}
