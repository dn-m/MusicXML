//
//  Sound.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The sound element contains general playback parameters. They can stand alone within a
/// part/measure, or be a component element within a direction.
///
/// Tempo is expressed in quarter notes per minute. If 0, the sound-generating program should prompt
/// the user at the time of compiling a sound (MIDI) file.
///
/// Dynamics (or MIDI velocity) are expressed as a percentage of the default forte value (90 for
/// MIDI 1.0).
///
/// MIDI devices, MIDI instruments, and playback techniques are changed using the midi-device,
/// midi-instrument, and play elements. When there are multiple instances of these elements, they
/// should be grouped together by instrument using the id attribute values.
///
/// The offset element is used to indicate that the sound takes place offset from the current score
/// position. If the sound element is a child of a direction element, the sound offset element
/// overrides the direction offset element if both elements are present. Note that the offset
/// reflects the intended musical position for the change in sound. It should not be used to
/// compensate for latency issues in particular hardware configurations.
public struct Sound {
    // MARK: - Instance Properties

    public let tempo: Double?
    public let dynamics: Double?
    public let dacapo: Bool?
    public let segno: String?
    public let dalsegno: String?
    public let coda: String?
    public let tocoda: String?
    public let divisions: Divisions?
    public let forwardRepeat: Bool?
    public let fine: String?
    public let timeOnly: TimeOnly?
    public let pizzicato: Bool?
    public let pan: Double?
    public let elevation: Double?
    public let damperPedal: YesNoNumber?
    public let softPedal: YesNoNumber?
    public let sostenutoPedal: YesNoNumber?
    public let offset: Offset?
    public let midi: [MIDI]

    // MARK: - Initializers

    public init(tempo: Double? = nil, dynamics: Double? = nil, dacapo: Bool? = nil, segno: String? = nil, dalsegno: String? = nil, coda: String? = nil, tocoda: String? = nil, divisions: Divisions? = nil, forwardRepeat: Bool? = nil, fine: String? = nil, timeOnly: TimeOnly? = nil, pizzicato: Bool? = nil, pan: Double? = nil, elevation: Double? = nil, damperPedal: YesNoNumber? = nil, softPedal: YesNoNumber? = nil, sostenutoPedal: YesNoNumber? = nil, offset: Offset? = nil, midi: [MIDI] = []) {
        self.tempo = tempo
        self.dynamics = dynamics
        self.dacapo = dacapo
        self.segno = segno
        self.dalsegno = dalsegno
        self.coda = coda
        self.tocoda = tocoda
        self.divisions = divisions
        self.forwardRepeat = forwardRepeat
        self.fine = fine
        self.timeOnly = timeOnly
        self.pizzicato = pizzicato
        self.pan = pan
        self.elevation = elevation
        self.damperPedal = damperPedal
        self.softPedal = softPedal
        self.sostenutoPedal = sostenutoPedal
        self.offset = offset
        self.midi = midi
    }
}

extension Sound {
    public struct MIDI {
        // MARK: - Instance Properties

        /// The midi-device type corresponds to the DeviceName meta event in Standard MIDI Files.
        /// Unlike the DeviceName meta event, there can be multiple midi-device elements per
        /// MusicXML part starting in MusicXML 3.0.
        public let midiDevice: MIDIDevice?

        /// The midi-instrument type defines MIDI 1.0 instrument playback. The midi-instrument
        /// element can be a part of either the score-instrument element at the start of a part, or
        /// the sound element within a part. The id attribute refers to the score-instrument
        /// affected by the change.
        public let midiInstrument: MIDIInstrument?

        /// The play type, new in Version 3.0, specifies playback techniques to be used in
        /// conjunction with the instrument-sound element. When used as part of a sound element, it
        /// applies to all notes going forward in score order. In multi-instrument parts, the
        /// affected instrument should be specified using the id attribute. When used as part of a
        /// note element, it applies to the current note only.
        public let play: Play?

    // MARK: - Initializers

        public init(midiDevice: MIDIDevice? = nil, midiInstrument: MIDIInstrument? = nil, play: Play? = nil) {
            self.midiDevice = midiDevice
            self.midiInstrument = midiInstrument
            self.play = play
        }
    }
}

extension Sound.MIDI: Equatable {}
extension Sound.MIDI: Codable {
    enum CodingKeys: String, CodingKey {
        case midiDevice = "midi-device"
        case midiInstrument = "midi-instrument"
        case play
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.midiDevice = try container.decodeIfPresent(MIDIDevice.self, forKey: .midiDevice)
        self.midiInstrument = try container.decodeIfPresent(MIDIInstrument.self, forKey: .midiInstrument)
        self.play = try container.decodeIfPresent(Play.self, forKey: .play)
    }
}

extension Sound: Equatable {}
extension Sound: Codable {
    enum CodingKeys: String, CodingKey {
        case tempo
        case dynamics
        case dacapo
        case segno
        case dalsegno
        case coda
        case tocoda
        case divisions
        case forwardRepeat = "forward-repeat"
        case fine
        case timeOnly = "time-only"
        case pizzicato
        case pan
        case elevation
        case damperPedal = "damper-pedal"
        case softPedal = "soft-pedal"
        case sostenutoPedal = "sostenuto-pedal"
        case offset
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tempo = try container.decodeIfPresent(Double.self, forKey: .tempo)
        self.dynamics = try container.decodeIfPresent(Double.self, forKey: .dynamics)
        self.dacapo = try container.decodeIfPresent(Bool.self, forKey: .dacapo)
        self.segno = try container.decodeIfPresent(String.self, forKey: .segno)
        self.dalsegno = try container.decodeIfPresent(String.self, forKey: .dalsegno)
        self.coda = try container.decodeIfPresent(String.self, forKey: .coda)
        self.tocoda = try container.decodeIfPresent(String.self, forKey: .tocoda)
        self.divisions = try container.decodeIfPresent(Divisions.self, forKey: .divisions)
        self.forwardRepeat = try container.decodeIfPresent(Bool.self, forKey: .forwardRepeat)
        self.fine = try container.decodeIfPresent(String.self, forKey: .fine)
        self.timeOnly = try container.decodeIfPresent(TimeOnly.self, forKey: .timeOnly)
        self.pizzicato = try container.decodeIfPresent(Bool.self, forKey: .pizzicato)
        self.pan = try container.decodeIfPresent(Double.self, forKey: .pan)
        self.elevation = try container.decodeIfPresent(Double.self, forKey: .elevation)
        self.damperPedal = try container.decodeIfPresent(YesNoNumber.self, forKey: .damperPedal)
        self.softPedal = try container.decodeIfPresent(YesNoNumber.self, forKey: .softPedal)
        self.sostenutoPedal = try container.decodeIfPresent(YesNoNumber.self, forKey: .sostenutoPedal)

        let singleValueContainer = try decoder.singleValueContainer()
        let components = try singleValueContainer.decode([MIDIComponent].self)
        self.midi = MIDI.assemble(from: components)

        self.offset = try container.decodeIfPresent(Offset.self, forKey: .offset)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        fatalError("TODO")
    }
}

internal enum MIDIComponent {
    case midiDevice(MIDIDevice)
    case midiInstrument(MIDIInstrument)
    case play(Play)
}

extension MIDIComponent: Decodable {
    enum CodingKeys: String, CodingKey {
        case midiDevice = "midi-device"
        case midiInstrument = "midi-instrument"
        case play
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.midiDevice) {
            self = .midiDevice(try decode(.midiDevice))
        } else if container.contains(.midiInstrument) {
            self = .midiInstrument(try decode(.midiInstrument))
        } else if container.contains(.play) {
            self = .play(try decode(.play))
        } else {
            throw DecodingError.typeMismatch(
                MIDIComponent.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension Sound.MIDI {
    internal static func assemble(from components: [MIDIComponent]) -> [Sound.MIDI] {
        var previousDevice: MIDIDevice?
        var previousInstrument: MIDIInstrument?
        var midi = [Sound.MIDI]()
        components.forEach {
            switch $0 {
            case let .midiDevice(device):
                if previousDevice != nil || previousInstrument != nil {
                    midi.append(.init(
                        midiDevice: previousDevice,
                        midiInstrument: previousInstrument
                    )
                    )
                }
                previousDevice = device
                previousInstrument = nil
            case let .midiInstrument(instrument):
                if previousInstrument != nil {
                    midi.append(.init(
                        midiDevice: previousDevice,
                        midiInstrument: previousInstrument
                    )
                    )
                }
                previousDevice = nil
                previousInstrument = instrument
            case let .play(play):
                midi.append(.init(
                    midiDevice: previousDevice,
                    midiInstrument: previousInstrument,
                    play: play
                )
                )
                previousDevice = nil
                previousInstrument = nil
            }
        }
        return midi
    }
}

import XMLCoder
extension MIDIComponent.CodingKeys: XMLChoiceCodingKey {}

extension Sound: DynamicNodeDecoding {
    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        switch key {
        case CodingKeys.offset:
            return .element
        default:
            return .attribute
        }
    }
}
