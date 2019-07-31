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
    public let printStyleAlign: PrintStyleAlign?
    public let enclosure: EnclosureShape?
    public let kind: Kind
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
        case timpani(Empty)
        case wood(Wood)
    }
}

extension Percussion.Kind: Equatable { }
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
        case let .timpani(value):
            try container.encode(value, forKey: .timpani)
        case let .wood(value):
            try container.encode(value, forKey: .wood)
        }
    }
    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        do {
            self = .beater(try decode(.beater))
        } catch {
            do {
                self = .effect(try decode(.effect))
            } catch {
                do {
                    self = .glass(try decode(.glass))
                } catch {
                    do {
                        self = .membrane(try decode(.membrane))
                    } catch {
                        do {
                            self = .metal(try decode(.metal))
                        } catch {
                            do {
                                self = .other(try decode(.other))
                            } catch {
                                do {
                                    self = .pitched(try decode(.pitched))
                                } catch {
                                    do {
                                        self = .stickLocation(try decode(.stickLocation))
                                    } catch {
                                        do {
                                            self = .timpani(try decode(.timpani))
                                        } catch {
                                            self = .wood(try decode(.wood))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension Percussion.Kind.CodingKeys: XMLChoiceCodingKey { }

extension Percussion: Equatable { }
extension Percussion: Codable { }
