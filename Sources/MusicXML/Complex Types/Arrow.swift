//
//  Arrow.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The arrow element represents an arrow used for a musical technical indication.
public struct Arrow {
    public enum Kind {
        case circular(CircularArrow)
        case linear(ArrowDirection, ArrowStyle?)
    }
    public let kind: Kind
    public let position: Position
    public let printStyle: PrintStyle
    public let placement: AboveBelow?
}

extension Arrow.Kind: Equatable { }

extension Arrow.Kind: Decodable {
    #warning("TODO: Implement Arrow.Kind: Decoder conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Arrow.Kind.init(from: Decoder) not yet implemented!")
    }
}

extension Arrow: Equatable { }
extension Arrow: Decodable { }
