//
//  Articulations.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

// FIXME: Consider just storing an `[Articulation]` rather than having a dedicated wrapping struct.
public struct Articulations {
    let values: [Articulation]

    public init(_ values: [Articulation]) {
        self.values = values
    }
}

extension Articulations: Equatable {}

extension Articulations: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.values = try container.decode([Articulation].self)
    }
}
