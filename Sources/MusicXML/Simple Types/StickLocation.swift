//
//  StickLocation.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The stick-location type represents pictograms for the location of sticks, beaters, or mallets on
/// cymbals, gongs, drums, and other instruments.
public enum StickLocation: String {
    case center
    case rim
    case cymbalBell = "cymbal bell"
    case cymbalEdge = "cymbal edge"
}

extension StickLocation: Equatable { }
extension StickLocation: Decodable { }
