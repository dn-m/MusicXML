//
//  MetronomeTuplet.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The metronome-tuplet type uses the same element structure as the time-modification element along
/// with some attributes from the tuplet element.
public struct MetronomeTuplet {
    public let value: TimeModification
    public let type: StartStop
    public let bracket: Bool?
    public let showNumber: ShowTuplet?

    public init(_ value: TimeModification, type: StartStop, bracket: Bool? = nil, showNumber: ShowTuplet? = nil) {
        self.value = value
        self.type = type
        self.bracket = bracket
        self.showNumber = showNumber
    }
}

extension MetronomeTuplet: Equatable { }
extension MetronomeTuplet: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case bracket
        case showNumber
        case value = ""
    }
}
