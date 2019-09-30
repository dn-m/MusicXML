//
//  MIDIDevice.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The midi-device type corresponds to the DeviceName meta event in Standard MIDI Files. Unlike the
/// DeviceName meta event, there can be multiple midi-device elements per MusicXML part starting in
/// MusicXML 3.0.
public struct MIDIDevice {
    public var value: String?
    /// The optional port attribute is a number from 1 to 16 that can be used with the unofficial
    /// MIDI port (or cable) meta event.
    public var port: Int?
    /// The optional id attribute refers to the score-instrument assigned to this device. If
    /// missing, the device assignment affects all score-instrument elements in the score-part.
    public var id: String?
}

extension MIDIDevice: Equatable { }
extension MIDIDevice: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case port
        case id
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        if let port = port {
            try container.encode(String(port), forKey: .port)
        }
        try container.encodeIfPresent(id, forKey: .id)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        if let portString = try container.decodeIfPresent(String.self, forKey: .port) {
            self.port = Int(portString)!
        }
        self.id = try container.decode(String.self, forKey: .id)
    }
}

