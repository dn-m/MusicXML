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

    public enum Kind {
        case encoder(String)
        case date(String)
        case description(String)
        case software(String)
        case supports(Supports)
    }

    public let values: [Kind]

    public init(values: [Kind]) {
        self.values = values
    }
}

extension Encoding.Kind: Equatable { }
extension Encoding.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case encoder
        case date = "encoding-date"
        case description = "encoding-description"
        case software
        case supports
    }
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
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .encoder(try container.decode(String.self, forKey: .encoder))
        } catch {
            do {
                self = .date(try container.decode(String.self, forKey: .date))
            } catch {
                do {
                    self = .description(
                        try container.decode(String.self, forKey: .description)
                    )
                } catch {
                    do {
                        self = .software(try container.decode(String.self, forKey: .software))
                    } catch {
                        self = .supports(try container.decode(Supports.self, forKey: .supports))
                    }
                }
            }
        }
    }
}
extension Encoding.Kind.CodingKeys: XMLChoiceCodingKey {}

extension Encoding: Equatable { }

extension Encoding: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.values = try container.decode([Kind].self)
    }
}
