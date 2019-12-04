//
//  Level.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The level type is used to specify editorial information for different MusicXML elements.
public struct Level {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let reference: Bool

    // MARK: Attribute Groups

    public let levelDisplay: LevelDisplay

    // MARK: - Initializers

    public init(reference: Bool, levelDisplay: LevelDisplay) {
        self.reference = reference
        self.levelDisplay = levelDisplay
    }
}

extension Level: Equatable {}
extension Level: Codable {}
