//
//  Articulations.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// Articulations and accents are grouped together here.
public enum Articulations {
    case accent(EmptyPlacement)
    case breathMark(BreathMark)
    case caesura(EmptyPlacement)
    case detachedLegato(EmptyPlacement)
    case doit(EmptyLine)
    case falloff(EmptyLine)
    case otherArticulation(PlacementText)
    case plop(EmptyLine)
    case scoop(EmptyLine)
    case spicatto(EmptyPlacement)
    case staccatissimo(EmptyPlacement)
    case staccato(EmptyPlacement)
    case stress(EmptyPlacement)
    case strongAccent(StrongAccent)
    case tenuto(EmptyPlacement)
    case unstress(EmptyPlacement)
}

extension Articulations: Equatable { }

extension Articulations: Codable {
    #warning("TODO: Implement Articulations: Codable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Articulations.init(from: Decoder) not yet implemented!")
    }
}
