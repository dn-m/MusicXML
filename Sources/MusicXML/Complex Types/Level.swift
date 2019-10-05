//
//  Level.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The level type is used to specify editorial information for different MusicXML elements.
public struct Level {
    public let reference: Bool
    public let levelDisplay: LevelDisplay

    public init(reference: Bool, levelDisplay: LevelDisplay) {
        self.reference = reference
        self.levelDisplay = levelDisplay
    }
}

extension Level: Equatable { }
extension Level: Codable { }
