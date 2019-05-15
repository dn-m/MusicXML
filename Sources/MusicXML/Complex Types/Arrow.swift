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
    // Attributes
    public let defaultX: Double?
    public let defaultY: Double?
    public let relativeX: Double?
    public let relativeY: Double?
    public let fontFamily: CommaSeparatedText?
    public let fontSize: FontSize?
    public let fontStyle: FontStyle?
    public let fontWeight: FontWeight?
    public let color: Color?
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
