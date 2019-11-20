//
//  DistanceType.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The distance-type defines what type of distance is being defined in a distance element. Values
/// include beam and hyphen. This is left as a string so that other application-specific types can
/// be defined, but it is made a separate type so that it can be redefined more strictly.
public enum DistanceType: String {
    case beam
    case hyphen
}

extension DistanceType: Equatable {}
extension DistanceType: Codable {}
