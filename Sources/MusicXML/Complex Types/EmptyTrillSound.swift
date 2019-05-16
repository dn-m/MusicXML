//
//  EmptyTrillSound.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The empty-trill-sound type represents an empty element with print-style, placement, and
/// trill-sound attributes.
public struct EmptyTrillSound {
    public let printStyle: PrintStyle?
    public let placement: Placement?
    public let trillSound: TrillSound
}

extension EmptyTrillSound: Equatable { }
extension EmptyTrillSound: Decodable { }
