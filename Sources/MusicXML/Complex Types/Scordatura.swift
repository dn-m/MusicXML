//
//  Scordatura.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// Scordatura string tunings are represented by a series of accord elements, similar to the
/// staff-tuning elements. Strings are numbered from high to low.
public struct Scordatura {
    // MARK: - Instance Properties

    // MARK: Elements

    public let accords: [Accord]

    // MARK: - Initializers

    public init(_ accords: [Accord]) {
        precondition(!accords.isEmpty)
        self.accords = accords
    }
}

extension Scordatura: Equatable {}
extension Scordatura: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case accords = "accord"
    }
}
