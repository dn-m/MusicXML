//
//  MusicData.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

import XMLCoder

// > Here is the basic musical data that is either associated
// > with a part or a measure, depending on whether partwise
// > or timewise hierarchy is used.
public struct MusicData {
    let values: [Datum]
}

extension MusicData {
    // <!ENTITY % music-data
    //   "(note | backup | forward | direction | attributes |
    //     harmony | figured-bass | print | sound | barline |
    //     grouping | link | bookmark)*">
    public enum Datum: Equatable {
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
}

extension MusicData: Equatable { }
extension MusicData: Codable { }

extension MusicData.Datum: Codable {

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

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .note(value):
            try container.encode(value, forKey: .note)
        case let .backup(value):
            try container.encode(value, forKey: .backup)
        case let .forward(value):
            try container.encode(value, forKey: .forward)
        case let .direction(value):
            try container.encode(value, forKey: .direction)
        case let .attributes(value):
            try container.encode(value, forKey: .attributes)
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

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        // FIXME: Attempt to escape do-try-catch hell
        do {
            self = .note(try decode(.note))
        } catch {
            do {
                self = .backup(try decode(.backup))
            } catch {
                do {
                    self = .forward(try decode(.forward))
                } catch {
                    do {
                        self = .attributes(try decode(.attributes))
                    } catch {
                        do {
                            self = .direction(try decode(.direction))
                        } catch {
                            do {
                                self = .harmony(try decode(.harmony))
                            } catch {
                                do {
                                    self = .figuredBass(try decode(.figuredBass))
                                } catch {
                                    do {
                                        self = .print(try decode(.print))
                                    } catch {
                                        do {
                                            self = .sound(try decode(.sound))
                                        } catch {
                                            do {
                                                self = .barline(try decode(.barline))
                                            } catch {
                                                do {
                                                    self = .grouping(try decode(.grouping))
                                                } catch {
                                                    do {
                                                        self = .link(try decode(.link))
                                                    } catch {
                                                        self = .bookmark(try decode(.bookmark))
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
        }
    }
}

extension MusicData.Datum.CodingKeys: XMLChoiceCodingKey { }
