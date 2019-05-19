//
//  Ornament.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

public enum Ornament {
    case delayedInvertedTurn(HorizontalTurn)
    case delayedTurn(HorizontalTurn)
    case invertedMordent(Mordent)
    case invertedTurn(HorizontalTurn)
    case mordent(Mordent)
    case otherOrnament(PlacementText)
    case shake(EmptyTrillSound)
    case tremolo(Tremolo)
    case trillMark(EmptyTrillSound)
    case turn(HorizontalTurn)
    case verticalTurn(EmptyTrillSound)
    case wavyLine(WavyLine)
}

extension Ornament: Equatable { }
extension Ornament: Decodable {
    #warning("TODO: Implement Ornament: Decodable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Ornament.init(from: Decoder) not yet implemented!")
    }
}
