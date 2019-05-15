//
//  Fan.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The fan type represents the type of beam fanning present on a note, used to represent
/// accelerandos and ritardandos.
public enum Fan: String {
    case accelerando = "accel"
    case ritardando = "rit"
    case none
}

extension Fan: Equatable { }
extension Fan: Decodable { }
