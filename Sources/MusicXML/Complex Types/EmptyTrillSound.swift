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
    public let placement: AboveBelow?
    public let trillSound: TrillSound

    public init(printStyle: PrintStyle? = nil, placement: AboveBelow? = nil, trillSound: TrillSound) {
        self.printStyle = printStyle
        self.placement = placement
        self.trillSound = trillSound
    }
}

extension EmptyTrillSound: Equatable { }
extension EmptyTrillSound: Codable { }
