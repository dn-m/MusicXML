//
//  Articulations.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

import XMLCoder

/// Articulations and accents are grouped together here.
public enum Articulations {
    case accent(EmptyPlacement)
    case breathMark(BreathMark)
    case caesura(EmptyPlacement)
    case detachedLegato(EmptyPlacement)
    case doit(EmptyLine)
    case falloff(EmptyLine)
    case otherArticulation(PlacementText)
    case plop(EmptyLine)
    case scoop(EmptyLine)
    case spicatto(EmptyPlacement)
    case staccatissimo(EmptyPlacement)
    case staccato(EmptyPlacement)
    case stress(EmptyPlacement)
    case strongAccent(StrongAccent)
    case tenuto(EmptyPlacement)
    case unstress(EmptyPlacement)
}

extension Articulations: Equatable { }

extension Articulations: Codable {
    enum CodingKeys: String, CodingKey {
        case accent
        case breathMark
        case caesura
        case detatchedLegato
        case doit
        case falloff
        case otherArticulation
        case plop
        case scoop
        case spicatto
        case staccatissimo
        case staccato
        case stress
        case strongAccent
        case tenuto
        case unstress
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .accent(value):
            try container.encode(value, forKey: .accent)
        case let .breathMark(value):
            try container.encode(value, forKey: .breathMark)
        case let .caesura(value):
            try container.encode(value, forKey: .caesura)
        case let .detachedLegato(value):
            try container.encode(value, forKey: .detatchedLegato)
        case let .doit(value):
            try container.encode(value, forKey: .doit)
        case let .falloff(value):
            try container.encode(value, forKey: .falloff)
        case let .otherArticulation(value):
            try container.encode(value, forKey: .otherArticulation)
        case let .plop(value):
            try container.encode(value, forKey: .plop)
        case let .scoop(value):
            try container.encode(value, forKey: .scoop)
        case let .spicatto(value):
            try container.encode(value, forKey: .spicatto)
        case let .staccatissimo(value):
            try container.encode(value, forKey: .staccatissimo)
        case let .staccato(value):
            try container.encode(value, forKey: .staccato)
        case let .stress(value):
            try container.encode(value, forKey: .stress)
        case let .strongAccent(value):
            try container.encode(value, forKey: .strongAccent)
        case let .tenuto(value):
            try container.encode(value, forKey: .tenuto)
        case let .unstress(value):
            try container.encode(value, forKey: .unstress)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        do {
            self = .accent(try decode(.accent))
        } catch {
            do {
                self = .breathMark(try decode(.breathMark))
            } catch {
                do {
                    self = .caesura(try decode(.caesura))
                } catch {
                    do {
                        self = .detachedLegato(try decode(.detatchedLegato))
                    } catch {
                        do {
                            self = .doit(try decode(.doit))
                        } catch {
                            do {
                                self = .falloff(try decode(.falloff))
                            } catch {
                                do {
                                    self = .otherArticulation(try decode(.otherArticulation))
                                } catch {
                                    do {
                                        self = .plop(try decode(.plop))
                                    } catch {
                                        do {
                                            self = .scoop(try decode(.scoop))
                                        } catch {
                                            do {
                                                self = .spicatto(try decode(.spicatto))
                                            } catch {
                                                do {
                                                    self = .staccatissimo(try decode(.staccatissimo))
                                                } catch {
                                                    do {
                                                        self = .staccato(try decode(.staccato))
                                                    } catch {
                                                        do  {
                                                            self = .stress(try decode(.stress))
                                                        } catch {
                                                            do {
                                                                self = .strongAccent(try decode(.strongAccent))
                                                            } catch {
                                                                do {
                                                                    self = .tenuto(try decode(.tenuto))
                                                                } catch {
                                                                    do {
                                                                        self = .unstress(try decode(.unstress))
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
            }
        }
    }
}

extension Articulations.CodingKeys: XMLChoiceCodingKey { }
