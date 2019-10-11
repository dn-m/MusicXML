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

extension Dynamic: Equatable { }
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.p) { self = .p }
        else if container.contains(.pp) { self = .pp }
        else if container.contains(.ppp) { self = .ppp }
        else if container.contains(.pppp) { self = .pppp }
        else if container.contains(.ppppp) { self = .ppppp }
        else if container.contains(.pppppp) { self = .pppppp }
        else if container.contains(.f) { self = .f }
        else if container.contains(.ff) { self = .ff }
        else if container.contains(.fff) { self = .fff }
        else if container.contains(.ffff) { self = .ffff }
        else if container.contains(.fffff) { self = .fffff }
        else if container.contains(.ffffff) { self = .ffffff }
        else if container.contains(.mp) { self = .mp }
        else if container.contains(.mf) { self = .mf }
        else if container.contains(.sf) { self = .sf }
        else if container.contains(.sfp) { self = .sfp }
        else if container.contains(.sfpp) { self = .sfpp }
        else if container.contains(.fp) { self = .fp }
        else if container.contains(.rf) { self = .rf }
        else if container.contains(.rfz) { self = .rfz }
        else if container.contains(.sfz) { self = .sfz }
        else if container.contains(.sffz) { self = .sffz }
        else if container.contains(.fz) { self = .fz }
        else if container.contains(.n) { self = .n }
        else if container.contains(.pf) { self = .pf }
        else if container.contains(.sfzp) { self = .sfzp }
        else if container.contains(.other) {
            self = .other(try container.decode(String.self, forKey: .other))
        } else {
            throw DecodingError.typeMismatch(Dynamic.self, DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unkown Dynamic value")
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        fatalError("TODO: Dynamic.encode(to:)")
    }
}

extension Dynamic.CodingKeys: XMLChoiceCodingKey { }
