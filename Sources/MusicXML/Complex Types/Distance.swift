//
//  Distance.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The distance element represents standard distances between notation elements in tenths.
public struct Distance {
    public let value: Tenths
    public let type: DistanceType
}

extension Distance: Equatable { }
extension Distance: Codable { }
