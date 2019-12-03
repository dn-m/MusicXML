//
//  Percussion.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

import XMLCoder

/// The percussion element is used to define percussion pictogram symbols. Definitions for these
/// symbols can be found in Kurt Stone's "Music Notation in the Twentieth Century" on pages 206-212
/// and 223. Some values are added to these based on how usage has evolved in the 30 years since
/// Stone's book was published.
public struct Percussion {
    // MARK: - Instance Properties

    public let printStyleAlign: PrintStyleAlign
    public let enclosure: EnclosureShape?
    public let kind: Kind

    public init(printStyleAlign: PrintStyleAlign = PrintStyleAlign(), enclosure: EnclosureShape? = nil, kind: Kind) {
        self.printStyleAlign = printStyleAlign
        self.enclosure = enclosure
        self.kind = kind
    }
}

extension Percussion {
    public enum Kind {
        case beater(Beater)
        case effect(Effect)
        case glass(Glass)
        case membrane(Membrane)
        case metal(Metal)
        case other(String)
        case pitched(Pitched)
        case stick(Stick)
        case stickLocation(StickLocation)
        case timpani
        case wood(Wood)
    }
}

extension Percussion.Kind: Equatable {}
extension Percussion.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case beater
        case effect
        case glass
        case membrane
        case metal
        case other
        case pitched
        case stick
        case stickLocation
        case timpani
        case wood
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .beater(value):
            try container.encode(value, forKey: .beater)
        case let .effect(value):
            try container.encode(value, forKey: .effect)
        case let .glass(value):
            try container.encode(value, forKey: .glass)
        case let .membrane(value):
            try container.encode(value, forKey: .membrane)
        case let .metal(value):
            try container.encode(value, forKey: .metal)
        case let .other(value):
            try container.encode(value, forKey: .other)
        case let .pitched(value):
            try container.encode(value, forKey: .pitched)
        case let .stick(value):
            try container.encode(value, forKey: .stick)
        case let .stickLocation(value):
            try container.encode(value, forKey: .stickLocation)
        case .timpani:
            try container.encode(Empty(), forKey: .timpani)
        case let .wood(value):
            try container.encode(value, forKey: .wood)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.beater) {
            self = .beater(try decode(.beater))
        } else if container.contains(.effect) {
            self = .effect(try decode(.effect))
        } else if container.contains(.glass) {
            self = .glass(try decode(.glass))
        } else if container.contains(.membrane) {
            self = .membrane(try decode(.membrane))
        } else if container.contains(.metal) {
            self = .metal(try decode(.metal))
        } else if container.contains(.other) {
            self = .other(try decode(.other))
        } else if container.contains(.pitched) {
            self = .pitched(try decode(.pitched))
        } else if container.contains(.stick) {
            self = .stick(try decode(.stick))
        } else if container.contains(.stickLocation) {
            self = .stickLocation(try decode(.stickLocation))
        } else if container.contains(.timpani) {
            self = .timpani
        } else if container.contains(.wood) {
            self = .wood(try decode(.wood))
        } else {
            throw DecodingError.typeMismatch(
                Percussion.Kind.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension Percussion.Kind.CodingKeys: XMLChoiceCodingKey {}

extension Percussion: Equatable {}
extension Percussion: Codable {
    enum CodingKeys: String, CodingKey {
        case enclosure
        case kind
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try printStyleAlign.encode(to: encoder)
        try container.encodeIfPresent(enclosure, forKey: .enclosure)
        try container.encode(kind, forKey: .kind)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        printStyleAlign = try PrintStyleAlign(from: decoder)
        enclosure = try container.decodeIfPresent(EnclosureShape.self, forKey: .enclosure)
        kind = try container.decode(Kind.self, forKey: .kind)
    }
}
