//
//  ScoreInstrument.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

/// The score-instrument type represents a single instrument within a score-part. As with the
/// score-part type, each score-instrument has a required ID attribute, a name, and an optional
/// abbreviation.  A score-instrument type is also required if the score specifies MIDI 1.0
/// channels, banks, or programs. An initial midi-instrument assignment can also be made here.
/// MusicXML software should be able to automatically assign reasonable channels and instruments
/// without these elements in simple cases, such as where part names match General MIDI instrument
/// names.
public struct ScoreInstrument {
    public let id: String
    public let instrumentName: String
    public let instrumentAbbreviation: String?
    public let sound: String
    public let soloOrEnsemble: SoloEnsemble?
    public let virtualInstrument: VirtualInstrument?
}

extension ScoreInstrument {
    public enum SoloEnsemble {
        case solo
        case ensemble(String)
    }
}

extension ScoreInstrument.SoloEnsemble: Equatable { }

extension ScoreInstrument.SoloEnsemble: Decodable {
    enum CodingKeys: String, CodingKey {
        case solo
        case ensemble
    }
    public init(from decoder: Decoder) throws {
        let keyed = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .ensemble(try keyed.decode(String.self, forKey: .ensemble))
        } catch {
            self = .solo
        }
    }
}

extension ScoreInstrument: Equatable { }
extension ScoreInstrument: Decodable { }
