//
//  Arpeggiate.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The arpeggiate type indicates that this note is part of an arpeggiated chord.
public struct Arpeggiate {

    // MARK: - Attributes

    public var number: Int?
    public var direction: UpDown?
    public var position: Position?
    public var placement: AboveBelow?
    public var color: Color?

    public init(number: Int? = nil, direction: UpDown? = nil, position: Position? = nil, placement: AboveBelow? = nil, color: Color? = nil) {
        self.number = number
        self.direction = direction
        self.position = position
        self.placement = placement
        self.color = color
    }
}

extension Arpeggiate: Equatable { }
extension Arpeggiate: Codable { }
