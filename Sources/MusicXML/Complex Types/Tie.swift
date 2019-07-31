//
//  Tie.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tie element indicates that a tie begins or ends with this note. The tie element indicates
/// sound; the tied element indicates notation.
public struct Tie {
    public let type: StartStop
    public let timeOnly: TimeOnly?
}

extension Tie: Equatable { }
extension Tie: Codable { }
