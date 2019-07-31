//
//  UprightInverted.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The upright-inverted type describes the appearance of a fermata element. The value is upright if
/// not specified.
public enum UprightInverted: String {
    case upright
    case inverted
}

extension UprightInverted: Equatable { }
extension UprightInverted: Codable { }
