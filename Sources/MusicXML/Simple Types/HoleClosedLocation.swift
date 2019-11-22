//
//  HoleClosedLocation.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The hole-closed-location type indicates which portion of the hole is filled in when the
/// corresponding hole-closed-value is half.
public enum HoleClosedLocation: String {
    case right
    case bottom
    case left
    case top
}

extension HoleClosedLocation: Equatable {}
extension HoleClosedLocation: Codable {}
