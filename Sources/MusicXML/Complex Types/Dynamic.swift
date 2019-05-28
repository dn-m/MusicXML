//
//  Dynamic.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

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
    case other(OtherDynamics)
}

extension Dynamic: Equatable { }
extension Dynamic: Decodable {
    #warning("TODO: Implement Dynamic: Decodable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Dynamic.init(from: Decoder) not yet implemented!")
    }
}
