//
//  Barre.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The barre element indicates placing a finger over multiple strings on a single fret. The type is
/// "start" for the lowest pitched string (e.g., the string with the highest MusicXML number) and is
/// "stop" for the highest pitched string.
public struct Barre {
    public let type: StartStop
    public let color: Color

    public init(type: StartStop, color: Color) {
        self.type = type
        self.color = color
    }
}

extension Barre: Equatable {}
extension Barre: Codable {}
