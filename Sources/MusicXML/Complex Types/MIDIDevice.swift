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
}

