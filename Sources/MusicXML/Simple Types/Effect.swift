//
//  Effect.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//
/// The effect type represents pictograms for sound effect percussion instruments. The cannon value
/// is in addition to Stone's list.
public enum Effect: String {
    case anvil
    case autoHorn = "auto horn"
    case birdWhistle = "bird whistle"
    case cannon
    case duckCall = "duck call"
    case gunShot = "gun shot"
    case klaxonHorn = "klaxon horn"
    case lionsRoar = "lions roar"
    case policeWhistle = "police whistle"
    case siren
    case slideWhistle = "slide whistle"
    case thunderSheet = "thunder sheet"
    case windMachine = "wind machine"
    case windWhistle = "wind whistle"
}

extension Effect: Equatable { }
extension Effect: Decodable { }
