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
}

extension MetronomeTuplet: Equatable { }
extension MetronomeTuplet: Codable { }
