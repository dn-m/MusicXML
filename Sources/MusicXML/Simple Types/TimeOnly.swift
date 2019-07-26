//
//  TimeOnly.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The time-only type is used to indicate that a particular playback-related element only applies
/// particular times through a repeated section. The value is a comma-separated list of positive
/// integers arranged in ascending order, indicating which times through the repeated section that
/// the element applies.
public struct TimeOnly {
    // > The value is a comma-separated list of
    // > positive integers arranged in ascending order, indicating which
    // > times through the repeated section that the element applies.
    public let values: [Int]
}

extension TimeOnly: Equatable { }
extension TimeOnly: Codable { }
