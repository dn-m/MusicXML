//
//  BendSound.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

// > The bend-sound entity is used for bend and slide elements,
// > and is similar to the trill-sound. Here the beats element
// > refers to the number of discrete elements (like MIDI pitch
// > bends) used to represent a continuous bend or slide. The
// > first-beat indicates the percentage of the direction for
// > starting a bend; the last-beat the percentage for ending it.
// > The default choices are:
//
// >     accelerate = "no"
// >     beats = "4" (minimum of "2")
// >     first-beat = "25"
// >     last-beat = "75"
public struct BendSound {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let accelerate: Bool?
    public let beats: Int?
    public let firstBeat: Int?
    public let lastBeat: Int?

    // MARK: - Initializers

    public init(accelerate: Bool? = nil, beats: Int? = nil, firstBeat: Int? = nil, lastBeat: Int? = nil) {
        self.accelerate = accelerate
        self.beats = beats
        self.firstBeat = firstBeat
        self.lastBeat = lastBeat
    }
}

extension BendSound: Equatable {}
extension BendSound: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case accelerate
        case beats
        case firstBeat = "first-beat"
        case lastBeat = "last-beat"
    }
}

extension BendSound.CodingKeys: XMLAttributeGroupCodingKey {}

import XMLCoder
extension BendSound: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.accelerate, CodingKeys.beats, CodingKeys.firstBeat, CodingKeys.lastBeat:
            return .attribute
        default:
            return .element
        }
    }
}
