//
//  LeftCenterRight.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The left-center-right type is used to define horizontal alignment and text justification.
public enum LeftCenterRight: String {
    case left
    case center
    case right
}

extension LeftCenterRight: Equatable { }
extension LeftCenterRight: Decodable { }
