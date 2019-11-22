//
//  RightLeftMiddle.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The right-left-middle type is used to specify barline location.
public enum RightLeftMiddle: String {
    case right
    case left
    case middle
}

extension RightLeftMiddle: Equatable {}
extension RightLeftMiddle: Codable {}
