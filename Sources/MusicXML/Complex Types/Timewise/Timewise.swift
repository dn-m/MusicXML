//
//  Timewise.swift
//  MusicXML
//
//  Created by James Bean on 8/5/19.
//

/// The `timewise` traversal of a `MusicXML` score.
public struct Timewise {

    // MARK: - Instance Properties

    // MARK: Elements

    /// The `Measure` values which comprise a `Timewise` traversal of a `MusicXML` score.
    let measures: [Measure]
}

extension Timewise: Equatable { }

extension Timewise: Codable {

    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case measures = "measure"
    }
}
