//
//  Technical.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Technical indications give performance information for individual instruments.
public struct Technical {
    public let values: [Technique]
}

extension Technical: Equatable { }
extension Technical: Decodable { }
