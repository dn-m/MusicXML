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
        case encodingDate(String)
        case encodingDescription(String)
        case software(String)
        case supports(Supports)
    }

    public let values: [Kind]
}

extension Encoding.Kind: Equatable { }
extension Encoding.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case encoder
        case encodingDate
        case encodingDescription
        case software
        case supports
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .encoder(value):
            try container.encode(value, forKey: .encoder)
        case let .encodingDate(value):
            try container.encode(value, forKey: .encodingDate)
        case let .encodingDescription(value):
            try container.encode(value, forKey: .encodingDescription)
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
                self = .encodingDate(try container.decode(String.self, forKey: .encodingDate))
            } catch {
                do {
                    self = .encodingDescription(
                        try container.decode(String.self, forKey: .encodingDescription)
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
extension Encoding: Codable { }
