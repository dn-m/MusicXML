//
//  StemValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The stem type represents the notated stem direction.
public enum StemValue: String {
    case down
    case up
    case double
    case none
}

extension StemValue: Equatable { }
extension StemValue: Decodable { }
