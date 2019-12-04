//
//  MetronomeTuplet.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The metronome-tuplet type uses the same element structure as the time-modification element along
/// with some attributes from the tuplet element.
public struct MetronomeTuplet {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: StartStop
    public let bracket: Bool?
    public let showNumber: ShowTuplet?

    // MARK: Value

    public let value: TimeModification

    // MARK: - Initializers

    public init(_ value: TimeModification, type: StartStop, bracket: Bool? = nil, showNumber: ShowTuplet? = nil) {
        self.value = value
        self.type = type
        self.bracket = bracket
        self.showNumber = showNumber
    }
}

extension MetronomeTuplet: Equatable {}
extension MetronomeTuplet: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case bracket
        case showNumber
        case value = ""
    }
}

import XMLCoder
extension MetronomeTuplet: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
