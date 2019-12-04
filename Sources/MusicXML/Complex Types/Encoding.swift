//
//  Encoding.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

import XMLCoder

/// The encoding element contains information about who did the digital encoding, when, with what
/// software, and in what aspects. Standard type values for the encoder element are music, words,
/// and arrangement, but other types may be used. The type attribute is only needed when there are
/// multiple encoder elements.
public struct Encoding {
    // MARK: - Instance Properties

    // MARK: Elements

    public let values: [Kind]

    // MARK: - Initializers

    public init(_ values: [Kind]) {
        self.values = values
    }
}

extension Encoding {
    public enum Kind {
        case encoder(String)
        case date(String)
        case description(String)
        case software(String)
        case supports(Supports)
    }
}

extension Encoding.Kind: Equatable {}
extension Encoding.Kind: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case encoder
        case date = "encoding-date"
        case description = "encoding-description"
        case software
        case supports
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .encoder(value):
            try container.encode(value, forKey: .encoder)
        case let .date(value):
            try container.encode(value, forKey: .date)
        case let .description(value):
            try container.encode(value, forKey: .description)
        case let .software(value):
            try container.encode(value, forKey: .software)
        case let .supports(value):
            try container.encode(value, forKey: .supports)
        }
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.encoder) {
            self = .encoder(try decode(.encoder))
        } else if container.contains(.date) {
            self = .date(try decode(.date))
        } else if container.contains(.description) {
            self = .description(try decode(.description))
        } else if container.contains(.software) {
            self = .software(try decode(.software))
        } else if container.contains(.supports) {
            self = .supports(try decode(.supports))
        } else {
            throw DecodingError.typeMismatch(
                Encoding.Kind.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension Encoding.Kind.CodingKeys: XMLChoiceCodingKey {}

extension Encoding: Equatable {}

extension Encoding: Codable {
    // MARK: - Codable

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.values = try container.decode([Kind].self)
    }
}
