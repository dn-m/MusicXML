//
//  StickType.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The stick-type type represents the shape of pictograms where the material in the stick, mallet,
/// or beater is represented in the pictogram.
public enum StickType: String {
    case bassDrum = "bass drum"
    case doubleBassDrum = "double bass drum"
    case timpani
    case xylophone
    case yarn
}

extension StickType: Equatable { }
extension StickType: Decodable { }
