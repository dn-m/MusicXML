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
}

extension HeelToe: Equatable { }
extension HeelToe: Codable { }
