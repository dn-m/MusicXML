//
//  Technique.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

import XMLCoder

public enum Technique {
    case arrow(Arrow)
    case bend(Bend)
    case doubleTongue(EmptyPlacement)
    case downBow(EmptyPlacement)
    case fingering(Fingering)
    case fingernails(EmptyPlacement)
    case fret(Fret)
    case hammerOn(HammerOnPullOff)
    case handbell(Handbell)
    case harmonic(Harmonic)
    case heel(HeelToe)
    case openString(EmptyPlacement)
    case otherTechnical(PlacementText)
    case pluck(PlacementText)
    case pullOff(HammerOnPullOff)
    case snapPizzicato(EmptyPlacement)
    case string(MusicXML.String) // FIXME: Swift.String vs. MusicXML.String
    case tap(PlacementText)
    case thumbPosition(EmptyPlacement)
    case toe(HeelToe)
    case tripleTongue(EmptyPlacement)
    case upBow(EmptyPlacement)
}

extension Technique: Equatable { }
extension Technique: Codable {
    enum CodingKeys: String, CodingKey {
        case arrow
        case bend
        case doubleTongue
        case downBow
        case fingering
        case fingernails
        case fret
        case hammerOn
        case handbell
        case harmonic
        case heel
        case openString
        case otherTechnical
        case pluck
        case pullOff
        case snapPizzicato
        case string
        case tap
        case thumbPosition
        case toe
        case tripleTongue
        case upBow
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .arrow(value):
            try container.encode(value, forKey: .arrow)
        case let .bend(value):
            try container.encode(value, forKey: .bend)
        case let .doubleTongue(value):
            try container.encode(value, forKey: .doubleTongue)
        case let .downBow(value):
            try container.encode(value, forKey: .downBow)
        case let .fingering(value):
            try container.encode(value, forKey: .fingering)
        case let .fingernails(value):
            try container.encode(value, forKey: .fingernails)
        case let .fret(value):
            try container.encode(value, forKey: .fret)
        case let .hammerOn(value):
            try container.encode(value, forKey: .hammerOn)
        case let .handbell(value):
            try container.encode(value, forKey: .handbell)
        case let .harmonic(value):
            try container.encode(value, forKey: .harmonic)
        case let .heel(value):
            try container.encode(value, forKey: .heel)
        case let .openString(value):
            try container.encode(value, forKey: .openString)
        case let .otherTechnical(value):
            try container.encode(value, forKey: .otherTechnical)
        case let .pluck(value):
            try container.encode(value, forKey: .pluck)
        case let .pullOff(value):
            try container.encode(value, forKey: .pullOff)
        case let .snapPizzicato(value):
            try container.encode(value, forKey: .snapPizzicato)
        case let .string(value):
            try container.encode(value, forKey: .string)
        case let .tap(value):
            try container.encode(value, forKey: .tap)
        case let .thumbPosition(value):
            try container.encode(value, forKey: .thumbPosition)
        case let .toe(value):
            try container.encode(value, forKey: .toe)
        case let .tripleTongue(value):
            try container.encode(value, forKey: .tripleTongue)
        case let .upBow(value):
            try container.encode(value, forKey: .upBow)
        }
    }
    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        // Touché Xcode
        do {
            self = .arrow(try decode(.arrow))
        } catch {
            do {
                self = .bend(try decode(.bend))
            } catch {
                do {
                    self = .doubleTongue(try decode(.doubleTongue))
                } catch {
                    do {
                        self = .downBow(try decode(.downBow))
                    } catch {
                        do {
                            self = .fingering(try decode(.fingering))
                        } catch {
                            do {
                                self = .fingernails(try decode(.fingernails))
                            } catch {
                                do {
                                    self = .fret(try decode(.fret))
                                } catch {
                                    do {
                                        self = .hammerOn(try decode(.hammerOn))
                                    } catch {
                                        do {
                                            self = .handbell(try decode(.handbell))
                                        } catch {
                                            do {
                                                self = .harmonic(try decode(.harmonic))
                                            } catch {
                                                do {
                                                    self = .heel(try decode(.heel))
                                                } catch {
                                                    do {
                                                        self = .openString(try decode(.openString))
                                                    } catch {
                                                        do {
                                                            self = .otherTechnical(try decode(.otherTechnical))
                                                        } catch {
                                                            do {
                                                                self = .pluck(try decode(.pluck))
                                                            } catch {
                                                                do {
                                                                    self = .pullOff(try decode(.pullOff))
                                                                } catch {
                                                                    do {
                                                                        self = .snapPizzicato(try decode(.snapPizzicato))
                                                                    } catch {
                                                                        do {
                                                                            self = .string(try decode(.string))
                                                                        } catch {
                                                                            do {
                                                                                self = .tap(try decode(.tap))
                                                                            } catch {
                                                                                do {
                                                                                    self = .thumbPosition(try decode(.thumbPosition))
                                                                                } catch {
                                                                                    do {
                                                                                        self = .toe(try decode(.toe))
                                                                                    } catch {
                                                                                        do {
                                                                                            self = .tripleTongue(try decode(.tripleTongue))
                                                                                        } catch {
                                                                                            self = .upBow(try decode(.upBow))
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
                }
            }
        }
    }
}

extension Technique.CodingKeys: XMLChoiceCodingKey { }
