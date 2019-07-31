//
//  Wood.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The wood type represents pictograms for wood percussion instruments. The maraca and maracas
/// values distinguish the one- and two-maraca versions of the pictogram. The vibraslap and
/// castanets values are in addition to Stone's list.
public enum Wood: String {
    case boardClapper = "board clapper"
    case cabasa
    case castanets
    case claves
    case guiro
    case logDrum = "log drum"
    case maraca
    case maracas
    case ratchet
    case sandpaperBlocks = "sandpaper blocks"
    case slitDrum = "slit drum"
    case templeBlock = "temple block"
    case vibraslap
    case woodBlock = "wood block"
}

extension Wood: Equatable { }
extension Wood: Codable { }
