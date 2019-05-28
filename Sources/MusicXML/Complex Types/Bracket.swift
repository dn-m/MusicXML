//
//  Bracket.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

public struct Bracket {
    public let type: StartStopContinue
    public let number: Int?
    /// The line-end attribute specifies if there is a jog up or down (or both), an arrow, or
    /// nothing at the start or end of the bracket. If the line-end is up or down, the length of the
    /// jog can be specified using the end-length attribute.
    public let lineEnd: LineEnd
    public let endLength: Tenths?
    public let lineType: LineType?
    public let dashLength: Tenths?
    public let spaceLength: Tenths?
    public let position: Position?
    public let color: Color?
}

extension Bracket: Equatable { }
extension Bracket: Decodable { }
