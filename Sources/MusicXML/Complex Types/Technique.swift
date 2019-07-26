//
//  Technique.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

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
    case string(String) // FIXME: Swift.String vs. MusicXML.String
    case tap(PlacementText)
    case thumbPosition(EmptyPlacement)
    case toe(HeelToe)
    case tripleTongue(EmptyPlacement)
    case upBow(EmptyPlacement)
}

extension Technique: Equatable { }
extension Technique: Codable {
    #warning("TODO: Implement Technique: Codable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Technique.init(from: Decoder) not yet implemented!")
    }
}


