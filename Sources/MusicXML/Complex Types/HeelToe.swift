//
//  HeelToe.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The heel and toe elements are used with organ pedals.
public struct HeelToe {
    public let placement: AboveBelow?
    public let substitution: Bool?

    public init(placement: AboveBelow? = nil, substitution: Bool? = nil) {
        self.placement = placement
        self.substitution = substitution
    }
}

extension HeelToe: Equatable { }
extension HeelToe: Codable { }
