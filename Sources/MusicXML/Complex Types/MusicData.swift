//
//  MusicData.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

// > Here is the basic musical data that is either associated
// > with a part or a measure, depending on whether partwise
// > or timewise hierarchy is used.
public struct MusicData: Equatable {

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

    let values: [Datum]
}

extension MusicData: Decodable {

    // MARK: - Decodable

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.values = try container.decode([Datum].self)
    }
}

extension MusicData.Datum: Decodable {

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

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Decodable {
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
