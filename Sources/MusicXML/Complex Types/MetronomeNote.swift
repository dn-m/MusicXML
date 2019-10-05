//
//  MetronomeNote.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The metronome-note type defines the appearance of a note within a metric relationship mark.
public struct MetronomeNote {
    public let metronomeType: NoteTypeValue
    public let metronomeDot: [Empty]
    public let metronomeBeam: [MetronomeBeam]
    public let metronomeTuplet: MetronomeTuplet?

    public init(metronomeType: NoteTypeValue, metronomeDot: [Empty], metronomeBeam: [MetronomeBeam], metronomeTuplet: MetronomeTuplet? = nil) {
        self.metronomeType = metronomeType
        self.metronomeDot = metronomeDot
        self.metronomeBeam = metronomeBeam
        self.metronomeTuplet = metronomeTuplet
    }
}

extension MetronomeNote: Equatable { }
extension MetronomeNote: Codable { }
