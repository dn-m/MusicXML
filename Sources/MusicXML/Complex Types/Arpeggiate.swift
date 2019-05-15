//
//  Arpeggiate.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The arpeggiate type indicates that this note is part of an arpeggiated chord.
public struct Arpeggiate {
    public let number: NumberLevel?
    public let direction: UpDown?
    public let defaultX: Tenths?
    public let defaultY: Tenths?
    public let relativeX: Tenths?
    public let relativeY: Tenths?
    public let placement: AboveBelow?
    public let color: Color?
}

extension Arpeggiate: Equatable { }
extension Arpeggiate: Decodable { }
