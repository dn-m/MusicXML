//
//  Cancel.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// A cancel element indicates that the old key signature should be cancelled before the new one
/// appears. This will always happen when changing to C major or A minor and need not be specified
/// then. The cancel value matches the fifths value of the cancelled key signature (e.g., a cancel
/// of -2 will provide an explicit cancellation for changing from B flat major to F major).
public struct Cancel {
    // MARK: - Instance Properties

    public let fifths: Int
    public let location: CancelLocation

    // MARK - Initializers

    public init(fifths: Int, location: CancelLocation) {
        self.fifths = fifths
        self.location = location
    }
}

extension Cancel: Equatable {}
extension Cancel: Codable {}
