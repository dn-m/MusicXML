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

    public init(_ value: Tenths, type: DistanceType) {
        self.value = value
        self.type = type
    }
}

extension Distance: Equatable {}
extension Distance: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case value = ""
    }
}
