//
//  TrillSound.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The trill-sound attribute group includes attributes used to guide the sound of trills, mordents,
/// turns, shakes, and wavy lines, based on MuseData sound suggestions. The default choices are:
///
///     start-note = "upper"
///     trill-step = "whole"
///     two-note-turn = "none"
///     accelerate = "no"
///     beats = "4".
///
/// Second-beat and last-beat are percentages for landing on the indicated beat, with defaults of 25
/// and 75 respectively.
///
/// For mordent and inverted-mordent elements, the defaults are different:
///
///     The default start-note is "main", not "upper".
///     The default for beats is "3", not "4".
///     The default for second-beat is "12", not "25".
///     The default for last-beat is "24", not "75".
///
public struct TrillSound {
    // MARK: - Instance Properties

    // MARK: Attributes

    let startNote: StartNote?
    let trillStep: TrillStep?
    let twoNoteTurn: TwoNoteTurn?
    let accelerate: Bool?
    let beats: Int?
    let secondBeat: Int?
    let lastBeat: Int?

    // MARK: - Initializers

    public init(startNote: StartNote? = nil, trillStep: TrillStep? = nil, twoNoteTurn: TwoNoteTurn? = nil, accelerate: Bool? = nil, beats: Int? = nil, secondBeat: Int? = nil, lastBeat: Int? = nil) {
        self.startNote = startNote
        self.trillStep = trillStep
        self.twoNoteTurn = twoNoteTurn
        self.accelerate = accelerate
        self.beats = beats
        self.secondBeat = secondBeat
        self.lastBeat = lastBeat
    }
}

extension TrillSound: Equatable {}

extension TrillSound: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case startNote = "start-note"
        case trillStep = "trill-step"
        case twoNoteTurn = "two-note-turn"
        case accelerate
        case beats
        case secondBeat = "second-beat"
        case lastBeat = "last-beat"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.startNote = try container.decodeIfPresent(StartNote.self, forKey: .startNote)
        self.trillStep = try container.decodeIfPresent(TrillStep.self, forKey: .trillStep)
        self.twoNoteTurn = try container.decodeIfPresent(TwoNoteTurn.self, forKey: .twoNoteTurn)
        self.accelerate = try container.decodeIfPresent(Bool.self, forKey: .accelerate)
        self.beats = try container.decodeIfPresent(Int.self, forKey: .beats)
        self.secondBeat = try container.decodeIfPresent(Int.self, forKey: .secondBeat)
        self.lastBeat = try container.decodeIfPresent(Int.self, forKey: .lastBeat)
    }
}

extension TrillSound.CodingKeys: XMLAttributeGroupCodingKey {}

import XMLCoder
extension TrillSound: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.startNote:
            return .attribute
        case CodingKeys.trillStep:
            return .attribute
        case CodingKeys.twoNoteTurn:
            return .attribute
        case CodingKeys.accelerate:
            return .attribute
        case CodingKeys.beats:
            return .attribute
        case CodingKeys.secondBeat:
            return .attribute
        case CodingKeys.lastBeat:
            return .attribute
        default:
        return .element
        }
    }
}
