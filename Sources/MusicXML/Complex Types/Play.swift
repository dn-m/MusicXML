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
    // MARK: - Instance Properties

    // MARK: Elements

    public let values: [Kind]

    // MARK: - Initializers

    public init(_ values: [Kind]) {
        self.values = values
    }
}

extension Play {
    public enum Kind {
        case ipa(String)
        case mute(Mute)
        case semiPitched(SemiPitched)
        case otherPlay(OtherPlay)
    }
}

extension Play.Kind: Equatable {}
extension Play.Kind: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case ipa
        case mute
        case semiPitched = "semi-pitched"
        case otherPlay = "other-play"
    }

    // MARK: Encodable

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

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.ipa) {
            self = .ipa(try decode(.ipa))
        } else if container.contains(.mute) {
            self = .mute(try decode(.mute))
        } else if container.contains(.semiPitched) {
            self = .semiPitched(try decode(.semiPitched))
        } else if container.contains(.otherPlay) {
            self = .otherPlay(try decode(.otherPlay))
        } else {
            throw DecodingError.typeMismatch(
                Play.Kind.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension Play.Kind.CodingKeys: XMLChoiceCodingKey {}

extension Play: Equatable {}
extension Play: Codable {
    // MARK: - Codable

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.values = try container.decode([Kind].self)
    }
}

extension Play: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
