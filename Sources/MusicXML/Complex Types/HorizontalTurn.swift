//
//  HorizontalTurn.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The horizontal-turn type represents turn elements that are horizontal rather than vertical.
/// These are empty elements with print-style, placement, trill-sound, and slash attributes.
public struct HorizontalTurn {
    public let printStyle: PrintStyle?
    public let placement: Placement?
    public let trillSound: TrillSound?
    public let slash: Bool?
}

extension HorizontalTurn: Equatable { }
extension HorizontalTurn: Decodable { }
