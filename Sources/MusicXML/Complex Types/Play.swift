//
//  Play.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

import XMLCoder

/// The play type, new in Version 3.0, specifies playback techniques to be used in conjunction with
/// the instrument-sound element. When used as part of a sound element, it applies to all notes
/// going forward in score order. When used as part of a note element, it applies to the current
/// note only.
public struct Play {

    public enum Kind {
        case ipa(String)
        case mute(Mute)
        case semiPitched(SemiPitched)
        case otherPlay(OtherPlay)
    }

    public let values: [Kind]
}

extension Play.Kind: Equatable { }
extension Play.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case ipa
        case mute
        case semiPitched
        case otherPlay
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .ipa(value):
            try container.encode(value, forKey: .ipa)
        case let .mute(value):
            try container.encode(value, forKey: .mute)
        case let .semiPitched(value):
            try container.encode(value, forKey: .semiPitched)
        case let .otherPlay(value):
            try container.encode(value, forKey: .otherPlay)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .ipa(try container.decode(String.self, forKey: .ipa))
        } catch {
            do {
                self = .mute(try container.decode(Mute.self, forKey: .mute))
            } catch {
                do {
                    self = .semiPitched(try container.decode(SemiPitched.self, forKey: .semiPitched))
                } catch {
                    self = .otherPlay(try container.decode(OtherPlay.self, forKey: .otherPlay))
                }
            }
        }
    }
}

extension Play.Kind.CodingKeys: XMLChoiceCodingKey { }

extension Play: Equatable { }
extension Play: Codable { }
