//
//  ScorePart.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

import XMLCoder

/// Each MusicXML part corresponds to a track in a Standard MIDI Format 1 file. The score-instrument
/// elements are used when there are multiple instruments per track. The midi-device element is used
/// to make a MIDI device or port assignment for the given track or specific MIDI instruments.
/// Initial midi-instrument assignments may be made here as well.
#warning("TODO: Add support for ScorePart print-style, print-object, and justify")
public struct ScorePart {

    // MARK: - Attributes

    public var id: String

    // MARK: - Elements

    /// Identification contains basic metadata about the score. It includes the information in
    /// MuseData headers that may apply at a score-wide, movement-wide, or part-wide level. The
    /// creator, rights, source, and relation elements are based on Dublin Core.
    public var identification: Identification?

    /// The part-name type describes the name or abbreviation of a score-part element. Formatting
    /// attributes for the part-name element are deprecated in Version 2.0 in favor of the new
    /// part-name-display and part-abbreviation-display elements.
    public var name: PartName

    /// The part-name-display and part-abbreviation-display elements used in the score.mod file may
    /// also be used here to change how a part name or abbreviation is displayed over the course of
    /// a piece. They take effect when the current measure or a succeeding measure starts a new
    /// system.
    public var nameDisplay: NameDisplay?

    /// The part-name-display and part-abbreviation-display elements used in the score.mod file may
    /// also be used here to change how a part name or abbreviation is displayed over the course of
    /// a piece. They take effect when the current measure or a succeeding measure starts a new
    /// system.
    public var partAbbreviation: PartName?

    /// The part-name-display and part-abbreviation-display elements used in the score.mod file may
    /// also be used here to change how a part name or abbreviation is displayed over the course of
    /// a piece. They take effect when the current measure or a succeeding measure starts a new
    /// system.
    public var partAbbreviationDisplay: NameDisplay?

    /// The group element allows the use of different versions of the part for different purposes.
    /// Typical values include score, parts, sound, and data. Ordering information that is directly
    /// encoded in MuseData can be derived from the ordering within a MusicXML score or opus.
    public var group: [String]?

    /// The score-instrument type represents a single instrument within a score-part. As with the
    /// score-part type, each score-instrument has a required ID attribute, a name, and an optional
    /// abbreviation. A score-instrument type is also required if the score specifies MIDI 1.0
    /// channels, banks, or programs. An initial midi-instrument assignment can also be made here.
    /// MusicXML software should be able to automatically assign reasonable channels and instruments
    /// without these elements in simple cases, such as where part names match General MIDI
    /// instrument names.
    public var scoreInstrument: [ScoreInstrument]?

    /// The midi-device type corresponds to the DeviceName meta event in Standard MIDI Files. Unlike
    /// the DeviceName meta event, there can be multiple midi-device elements per MusicXML part
    /// starting in MusicXML 3.0.
    ///
    /// The midi-instrument type defines MIDI 1.0 instrument playback. The midi-instrument element
    /// can be a part of either the score-instrument element at the start of a part, or the sound
    /// element within a part. The id attribute refers to the score-instrument affected by the
    /// change.
    public var midi: [MIDI]?

    public init(id: String, identification: Identification? = nil, name: PartName, nameDisplay: NameDisplay? = nil, partAbbreviation: PartName? = nil, partAbbreviationDisplay: NameDisplay? = nil, group: [String]? = nil, scoreInstrument: [ScoreInstrument]? = nil, midi: [MIDI]? = nil) {
        self.id = id
        self.identification = identification
        self.name = name
        self.nameDisplay = nameDisplay
        self.partAbbreviation = partAbbreviation
        self.partAbbreviationDisplay = partAbbreviationDisplay
        self.group = group
        self.scoreInstrument = scoreInstrument
        self.midi = midi
    }
}

extension ScorePart {
    public struct MIDI {
        /// The midi-device type corresponds to the DeviceName meta event in Standard MIDI Files.
        /// Unlike the DeviceName meta event, there can be multiple midi-device elements per
        /// MusicXML part starting in MusicXML 3.0.
        public let midiDevice: MIDIDevice?

        /// The midi-instrument type defines MIDI 1.0 instrument playback. The midi-instrument
        /// element can be a part of either the score-instrument element at the start of a part, or
        /// the sound element within a part. The id attribute refers to the score-instrument
        /// affected by the change.
        public let midiInstrument: MIDIInstrument?

        public init(midiDevice: MIDIDevice? = nil, midiInstrument: MIDIInstrument? = nil) {
            self.midiDevice = midiDevice
            self.midiInstrument = midiInstrument
        }
    }
}

extension ScorePart.MIDI: Equatable { }
extension ScorePart.MIDI: Codable { }

extension ScorePart: Equatable { }
extension ScorePart: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case identification
        case name = "part-name"
        case nameDisplay = "name-display"
        case partAbbreviation = "part-abbreviation"
        case partAbbreviationDisplay = "part-abbreviation-display"
        case group
        case scoreInstrument = "score-instrument"
        case midiDevice = "midi-device"
        case midiInstrument = "midi-instrument"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(identification, forKey: .identification)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(nameDisplay, forKey: .nameDisplay)
        try container.encodeIfPresent(partAbbreviation, forKey: .partAbbreviation)
        try container.encodeIfPresent(partAbbreviationDisplay, forKey: .partAbbreviationDisplay)
        try container.encodeIfPresent(group, forKey: .group)
        try container.encodeIfPresent(scoreInstrument, forKey: .scoreInstrument)
        if let midi = midi {
            for individualMidi in midi {
                try container.encodeIfPresent(individualMidi.midiDevice, forKey: .midiDevice)
                try container.encodeIfPresent(individualMidi.midiInstrument, forKey: .midiInstrument)
            }
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.identification = try container.decodeIfPresent(Identification.self, forKey: .identification)
        self.name = try container.decode(PartName.self, forKey: .name)
        self.nameDisplay = try container.decodeIfPresent(NameDisplay.self, forKey: .nameDisplay)
        self.partAbbreviation = try container.decodeIfPresent(PartName.self, forKey: .partAbbreviation)
        self.partAbbreviationDisplay = try container.decodeIfPresent(NameDisplay.self, forKey: .partAbbreviationDisplay)
        self.group = try container.decodeIfPresent([String].self, forKey: .group)
        self.scoreInstrument = try container.decodeIfPresent([ScoreInstrument].self, forKey: .scoreInstrument)
        let midiDevice = try container.decodeIfPresent([MIDIDevice].self, forKey: .midiDevice)
        let midiInstrument = try container.decodeIfPresent([MIDIInstrument].self, forKey: .midiInstrument)
        if let midiDevice = midiDevice, let midiInstrument = midiInstrument {
            self.midi = zip(midiDevice, midiInstrument).map { (device, instrument) -> MIDI in
                return MIDI(midiDevice: device, midiInstrument: instrument)
            }
        }
    }
}

extension ScorePart: DynamicNodeDecoding {
    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        switch key {
        case CodingKeys.id:
            return .attribute
        default:
            return .element
        }
    }
}

extension ScorePart: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.id:
            return .attribute
        default:
            return .element
        }
    }
}
