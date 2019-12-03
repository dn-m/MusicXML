//
//  MusicData.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

import XMLCoder

// <!ENTITY % music-data
//   "(note | backup | forward | direction | attributes |
//     harmony | figured-bass | print | sound | barline |
//     grouping | link | bookmark)*">
public enum MusicData {
    case note(Note)
    case backup(Backup)
    case forward(Forward)
    case attributes(Attributes)
    case direction(Direction)
    case harmony(Harmony)
    case figuredBass(FiguredBass)
    case print(Print)
    case sound(Sound)
    case barline(Barline)
    case grouping(Grouping)
    case link(Link)
    case bookmark(Bookmark)
}

extension MusicData: Equatable {}

extension MusicData: Codable {
    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case note
        case backup
        case forward
        case direction
        case attributes
        case harmony
        case figuredBass = "figured-bass"
        case print
        case sound
        case barline
        case grouping
        case link
        case bookmark
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .note(value):
            try container.encode(value, forKey: .note)
        case let .backup(value):
            try container.encode(value, forKey: .backup)
        case let .forward(value):
            try container.encode(value, forKey: .forward)
        case let .attributes(value):
            try container.encode(value, forKey: .attributes)
        case let .direction(value):
            try container.encode(value, forKey: .direction)
        case let .harmony(value):
            try container.encode(value, forKey: .harmony)
        case let .figuredBass(value):
            try container.encode(value, forKey: .figuredBass)
        case let .print(value):
            try container.encode(value, forKey: .print)
        case let .sound(value):
            try container.encode(value, forKey: .sound)
        case let .barline(value):
            try container.encode(value, forKey: .barline)
        case let .grouping(value):
            try container.encode(value, forKey: .grouping)
        case let .link(value):
            try container.encode(value, forKey: .link)
        case let .bookmark(value):
            try container.encode(value, forKey: .bookmark)
        }
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.note) {
            self = .note(try decode(.note))
        } else if container.contains(.backup) {
            self = .backup(try decode(.backup))
        } else if container.contains(.forward) {
            self = .forward(try decode(.forward))
        } else if container.contains(.attributes) {
            self = .attributes(try decode(.attributes))
        } else if container.contains(.direction) {
            self = .direction(try decode(.direction))
        } else if container.contains(.harmony) {
            self = .harmony(try decode(.harmony))
        } else if container.contains(.figuredBass) {
            self = .figuredBass(try decode(.figuredBass))
        } else if container.contains(.print) {
            self = .print(try decode(.print))
        } else if container.contains(.sound) {
            self = .sound(try decode(.sound))
        } else if container.contains(.barline) {
            self = .barline(try decode(.barline))
        } else if container.contains(.grouping) {
            self = .grouping(try decode(.grouping))
        } else if container.contains(.link) {
            self = .link(try decode(.link))
        } else if container.contains(.bookmark) {
            self = .bookmark(try decode(.bookmark))
        } else {
            throw DecodingError.typeMismatch(
                MusicData.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension MusicData.CodingKeys: XMLChoiceCodingKey {}
