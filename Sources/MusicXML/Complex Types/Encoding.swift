//
//  Encoding.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The encoding element contains information about who did the digital encoding, when, with what
/// software, and in what aspects. Standard type values for the encoder element are music, words,
/// and arrangement, but other types may be used. The type attribute is only needed when there are
/// multiple encoder elements.
public struct Encoding {

    public enum Kind {
        case encoder(String)
        case encodingDate(String)
        case encodingDescription(String)
        case software(String)
        case supports(Supports)
    }

    public let values: [Kind]
}

extension Encoding.Kind: Equatable { }
extension Encoding.Kind: Decodable {
    #warning("TODO: Implement Encoding.Kind: Decodable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Encoding.Kind.init(from: Decoder) not yet implemented!")
    }
}

extension Encoding: Equatable { }
extension Encoding: Decodable { }
