//
//  StickMaterial.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The stick-material type represents the material being displayed in a stick pictogram.
public enum StickMaterial: String {
    case soft
    case medium
    case hard
    case shaded
    case x
}

extension StickMaterial: Equatable { }
extension StickMaterial: Decodable { }
