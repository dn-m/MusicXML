//
//  MetronomeNote.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The metronome-note type defines the appearance of a note within a metric relationship mark.
public struct MetronomeNote {
    // MARK: - Instance Properties

    // MARK: Elements

    public let metronomeType: NoteTypeValue
    public let metronomeDotCount: Int
    public let metronomeBeams: [MetronomeBeam]
    public let metronomeTuplet: MetronomeTuplet?

    // MARK: - Initializers

    public init(
        metronomeType: NoteTypeValue,
        metronomeDotCount: Int = 0,
        metronomeBeams: [MetronomeBeam] = [],
        metronomeTuplet: MetronomeTuplet? = nil
    ) {
        self.metronomeType = metronomeType
        self.metronomeDotCount = metronomeDotCount
        self.metronomeBeams = metronomeBeams
        self.metronomeTuplet = metronomeTuplet
    }
}

extension MetronomeNote: Equatable {}
extension MetronomeNote: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case metronomeType = "metronome-type"
        case metronomeDotCount = "metronome-dot"
        case metronomeBeams = "metronome-beam"
        case metronomeTuplet = "metronome-tuplet"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metronomeType = try container.decode(NoteTypeValue.self, forKey: .metronomeType)
        self.metronomeDotCount = try container.decode([Empty].self, forKey: .metronomeDotCount).count
        self.metronomeBeams = try container.decode([MetronomeBeam].self, forKey: .metronomeBeams)
        self.metronomeTuplet = try container.decodeIfPresent(MetronomeTuplet.self, forKey: .metronomeTuplet)
    }
}

import XMLCoder
// sourcery:inline:MetronomeNote.DynamicNodeEncoding
extension MetronomeNote: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end
