//
//  Arpeggiate.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The arpeggiate type indicates that this note is part of an arpeggiated chord.
public struct Arpeggiate {
    public let number: Int?
    public let direction: UpDown?
    public let position: Position
    public let placement: AboveBelow?
    public let color: Color?
}

extension Arpeggiate: Equatable { }
extension Arpeggiate: Decodable { }
