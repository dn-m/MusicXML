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

import XMLCoder
extension Level: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.reference:
            return .attribute
        default:
        return .element
        }
    }
}
