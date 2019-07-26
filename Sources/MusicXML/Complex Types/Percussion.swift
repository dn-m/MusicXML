//
//  Percussion.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

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
    #warning("TODO: Implement Percussion.Kind: Codable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Percussion.Kind.init(from: Decoder not yet implemented!)")
    }
}

extension Percussion: Equatable { }
extension Percussion: Codable { }
