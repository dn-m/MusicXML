//
//  Articulations.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

public struct Articulations {
    let values: [Articulation]

    public init(values: [Articulation]) {
        self.values = values
    }
}

extension Articulations: Equatable { }

extension Articulations: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.values = try container.decode([Articulation].self)
    }
}
