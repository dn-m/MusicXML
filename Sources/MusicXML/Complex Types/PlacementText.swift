//
//  PlacementText.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The placement-text type represents a text element with print-style and placement attribute
/// groups.
public struct PlacementText {
    public let position: Position
    public let printStyle: PrintStyle
    public let placement: AboveBelow
}

extension PlacementText: Equatable { }
extension PlacementText: Decodable { }
