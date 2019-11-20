//
//  LineEnd.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The line-end type specifies if there is a jog up or down (or both), an arrow, or nothing at the
/// start or end of a bracket.
public enum LineEnd: String {
    case up
    case down
    case both
    case arrow
    case none
}

extension LineEnd: Equatable {}
extension LineEnd: Codable {}
