//
//  Metal.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The metal type represents pictograms for metal percussion instruments. The hi-hat value refers
/// to a pictogram like Stone's high-hat cymbals but without the long vertical line at the bottom.
public enum Metal: String {
    case almglocken
    case bell
    case bellPlate = "bell plate"
    case brakeDrum = "brake drum"
    case chineseCymbal = "Chinese cymbal"
    case cowbell
    case crashCymbals = "crash cymbals"
    case crotale
    case cymbalTongs = "cymbal tongs"
    case domedGong = "domed gong"
    case fingerCymbals = "finger cymbals"
    case flexatone
    case gong
    case hiHat = "hi-hat"
    case highHatCymbals = "high-hat cymbals"
    case handbell
    case sistrum
    case sizzleCymbal = "sizzle cymbal"
    case sleighBells = "sleigh bells"
    case suspendedCymbal = "suspended cymbal"
    case tamTam = "tam tam"
    case triangle
    case vietnameseHat = "Vietnamese hat"
}

extension Metal: Equatable { }
extension Metal: Codable { }
