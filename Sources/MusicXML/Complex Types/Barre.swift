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
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: StartStop
    public let color: Color

    // MARK: - Initializers

    public init(type: StartStop, color: Color) {
        self.type = type
        self.color = color
    }
}

extension Barre: Equatable {}
extension Barre: Codable {}

import XMLCoder
extension Barre: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.type, CodingKeys.color:
            return .attribute
        default:
            return .element
        }
    }
}
