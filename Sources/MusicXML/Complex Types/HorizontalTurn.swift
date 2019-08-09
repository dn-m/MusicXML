//
//  HorizontalTurn.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The horizontal-turn type represents turn elements that are horizontal rather than vertical.
/// These are empty elements with print-style, placement, trill-sound, and slash attributes.
public struct HorizontalTurn {
    public var printStyle: PrintStyle?
    public var placement: AboveBelow?
    public var trillSound: TrillSound?
    public var slash: Bool?
}

extension HorizontalTurn: Equatable { }
extension HorizontalTurn: Codable { }
