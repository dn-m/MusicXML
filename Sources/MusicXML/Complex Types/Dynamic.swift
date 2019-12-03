//
//  Dynamic.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

import XMLCoder

public enum Dynamic {
    case p
    case pp
    case ppp
    case pppp
    case ppppp
    case pppppp
    case f
    case ff
    case fff
    case ffff
    case fffff
    case ffffff
    case mp
    case mf
    case sf
    case sfp
    case sfpp
    case fp
    case rf
    case rfz
    case sfz
    case sffz
    case fz
    case n
    case pf
    case sfzp
    case other(String)
}

extension Dynamic: Equatable {}
extension Dynamic: Codable {
    enum CodingKeys: String, CodingKey {
        case p
        case pp
        case ppp
        case pppp
        case ppppp
        case pppppp
        case f
        case ff
        case fff
        case ffff
        case fffff
        case ffffff
        case mp
        case mf
        case sf
        case sfp
        case sfpp
        case fp
        case rf
        case rfz
        case sfz
        case sffz
        case fz
        case n
        case pf
        case sfzp
        case other = "other-dynamics"
    }

    // MARK - Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .p:
            try container.encodeNil(forKey: .p)
        case .pp:
            try container.encodeNil(forKey: .pp)
        case .ppp:
            try container.encodeNil(forKey: .ppp)
        case .pppp:
            try container.encodeNil(forKey: .pppp)
        case .ppppp:
            try container.encodeNil(forKey: .ppppp)
        case .pppppp:
            try container.encodeNil(forKey: .pppppp)
        case .f:
            try container.encodeNil(forKey: .f)
        case .ff:
            try container.encodeNil(forKey: .ff)
        case .fff:
            try container.encodeNil(forKey: .fff)
        case .ffff:
            try container.encodeNil(forKey: .ffff)
        case .fffff:
            try container.encodeNil(forKey: .fffff)
        case .ffffff:
            try container.encodeNil(forKey: .ffffff)
        case .mp:
            try container.encodeNil(forKey: .mp)
        case .mf:
            try container.encodeNil(forKey: .mf)
        case .sf:
            try container.encodeNil(forKey: .sf)
        case .sfp:
            try container.encodeNil(forKey: .sfp)
        case .sfpp:
            try container.encodeNil(forKey: .sfpp)
        case .fp:
            try container.encodeNil(forKey: .fp)
        case .rf:
            try container.encodeNil(forKey: .rf)
        case .rfz:
            try container.encodeNil(forKey: .rfz)
        case .sfz:
            try container.encodeNil(forKey: .sfz)
        case .sffz:
            try container.encodeNil(forKey: .sffz)
        case .fz:
            try container.encodeNil(forKey: .fz)
        case .n:
            try container.encodeNil(forKey: .n)
        case .pf:
            try container.encodeNil(forKey: .pf)
        case .sfzp:
            try container.encodeNil(forKey: .sfzp)
        case let .other(value):
            try container.encode(value, forKey: .other)
        }
    }

    // MARK - Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.p) {
            _ = try container.decodeNil(forKey: .p)
            self = .p
        } else if container.contains(.pp) {
            _ = try container.decodeNil(forKey: .pp)
            self = .pp
        } else if container.contains(.ppp) {
            _ = try container.decodeNil(forKey: .ppp)
            self = .ppp
        } else if container.contains(.pppp) {
            _ = try container.decodeNil(forKey: .pppp)
            self = .pppp
        } else if container.contains(.ppppp) {
            _ = try container.decodeNil(forKey: .ppppp)
            self = .ppppp
        } else if container.contains(.pppppp) {
            _ = try container.decodeNil(forKey: .pppppp)
            self = .pppppp
        } else if container.contains(.f) {
            _ = try container.decodeNil(forKey: .f)
            self = .f
        } else if container.contains(.ff) {
            _ = try container.decodeNil(forKey: .ff)
            self = .ff
        } else if container.contains(.fff) {
            _ = try container.decodeNil(forKey: .fff)
            self = .fff
        } else if container.contains(.ffff) {
            _ = try container.decodeNil(forKey: .ffff)
            self = .ffff
        } else if container.contains(.fffff) {
            _ = try container.decodeNil(forKey: .fffff)
            self = .fffff
        } else if container.contains(.ffffff) {
            _ = try container.decodeNil(forKey: .ffffff)
            self = .ffffff
        } else if container.contains(.mp) {
            _ = try container.decodeNil(forKey: .mp)
            self = .mp
        } else if container.contains(.mf) {
            _ = try container.decodeNil(forKey: .mf)
            self = .mf
        } else if container.contains(.sf) {
            _ = try container.decodeNil(forKey: .sf)
            self = .sf
        } else if container.contains(.sfp) {
            _ = try container.decodeNil(forKey: .sfp)
            self = .sfp
        } else if container.contains(.sfpp) {
            _ = try container.decodeNil(forKey: .sfpp)
            self = .sfpp
        } else if container.contains(.fp) {
            _ = try container.decodeNil(forKey: .fp)
            self = .fp
        } else if container.contains(.rf) {
            _ = try container.decodeNil(forKey: .rf)
            self = .rf
        } else if container.contains(.rfz) {
            _ = try container.decodeNil(forKey: .rfz)
            self = .rfz
        } else if container.contains(.sfz) {
            _ = try container.decodeNil(forKey: .sfz)
            self = .sfz
        } else if container.contains(.sffz) {
            _ = try container.decodeNil(forKey: .sffz)
            self = .sffz
        } else if container.contains(.fz) {
            _ = try container.decodeNil(forKey: .fz)
            self = .fz
        } else if container.contains(.n) {
            _ = try container.decodeNil(forKey: .n)
            self = .n
        } else if container.contains(.pf) {
            _ = try container.decodeNil(forKey: .pf)
            self = .pf
        } else if container.contains(.sfzp) {
            _ = try container.decodeNil(forKey: .sfzp)
            self = .sfzp
        } else if container.contains(.other) {
            self = .other(try decode(.other))
        } else {
            throw DecodingError.typeMismatch(
                Dynamic.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension Dynamic.CodingKeys: XMLChoiceCodingKey {}
