//
//  EmptyPlacement.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-placement type represents an empty element with print-style and placement attributes.
public struct EmptyPlacement {
    public let position: Position
    public let printStyle: PrintStyle
    public let placement: AboveBelow
}

extension EmptyPlacement: Equatable { }
extension EmptyPlacement: Codable { }
