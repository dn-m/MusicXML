//
//  EmptyPlacement.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-placement type represents an empty element with print-style and placement attributes.
public struct EmptyPlacement {
    public var position: Position?
    public var printStyle: PrintStyle?
    public var placement: AboveBelow?
}

extension EmptyPlacement: Equatable { }
extension EmptyPlacement: Codable { }
