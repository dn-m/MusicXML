//
//  ScoreInstrument.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

import XMLCoder

/// The score-instrument type represents a single instrument within a score-part. As with the
/// score-part type, each score-instrument has a required ID attribute, a name, and an optional
/// abbreviation.  A score-instrument type is also required if the score specifies MIDI 1.0
/// channels, banks, or programs. An initial midi-instrument assignment can also be made here.
/// MusicXML software should be able to automatically assign reasonable channels and instruments
/// without these elements in simple cases, such as where part names match General MIDI instrument
/// names.
public struct ScoreInstrument {

    // MARK: - Instance Properties

    // MARK: Attributes

    public var id: String

    // MARK: Elements

    public var name: String
    public var abbreviation: String?
    public var sound: String?
    public var soloOrEnsemble: SoloEnsemble?
    public var virtualInstrument: VirtualInstrument?

    // MARK: Initializers

    public init(
        id: String,
        name: String,
        abbreviation: String? = nil,
        sound: String? = nil,
        soloOrEnsemble: SoloEnsemble? = nil,
        virtualInstrument: VirtualInstrument? = nil
    ) {
        self.id = id
        self.name = name
        self.abbreviation = abbreviation
        self.sound = sound
        self.soloOrEnsemble = soloOrEnsemble
        self.virtualInstrument = virtualInstrument
    }
}

extension ScoreInstrument {
    public enum SoloEnsemble {
        case solo
        case ensemble(String)
    }
}

extension ScoreInstrument.SoloEnsemble: Equatable { }

extension ScoreInstrument.SoloEnsemble: Codable {
    enum CodingKeys: String, CodingKey {
        case solo
        case ensemble
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .solo:
            try container.encode("", forKey: .solo)
        case let .ensemble(value):
            try container.encode(value, forKey: .ensemble)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.ensemble) {
            self = .ensemble(try container.decode(String.self, forKey: .ensemble))
        } else if container.contains(.solo) {
            self = .solo
        } else {
            throw DecodingError.typeMismatch(
                ScoreInstrument.SoloEnsemble.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized ScoreInstrument.SoloEnsemble"
                )
            )
        }
    }
}

extension ScoreInstrument: Equatable { }
extension ScoreInstrument: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "instrument-name"
        case abbreviation = "instrument-abbreviation"
        case sound
        case soloOrEnsemble
        case virtualInstrument = "virtual-instrument"
    }
}

extension ScoreInstrument: DynamicNodeDecoding {
    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        switch key {
        case CodingKeys.id:
            return .attribute
        default:
            return .element
        }
    }
}

extension ScoreInstrument: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.id:
            return .attribute
        default:
            return .element
        }
    }
}
