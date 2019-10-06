//
//  Technical.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Technical indications give performance information for individual instruments.
public struct Technical {
    public var values: [Technique]
}

extension Technical: Equatable { }
extension Technical: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        values = try container.decode([Technique].self)
    }
}
