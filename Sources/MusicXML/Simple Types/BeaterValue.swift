//
//  BeaterValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The beater-value type represents pictograms for beaters, mallets, and sticks that do not have
/// different materials represented in the pictogram. The finger and hammer values are in addition
/// to Stone's list.
public enum BeaterValue: String {
    case bow
    case chimeHammer = "chime hammer"
    case coin
    case finger
    case fingernail
    case fist
    case guiroScraper = "guiro scraper"
    case hammer
    case hand
    case jazzStick = "jazz stick"
    case knittingNeedle = "knitting needle"
    case metalHammer = "metal hammer"
    case snareStick = "snare stick"
    case triangleBeater = "triangle beater"
    case triangleBeaterPlain = "triangle beater plain"
    case wireBrush = "wire brush"
}

extension BeaterValue: Equatable { }
extension BeaterValue: Decodable { }
