//
//  TupletDot.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tuplet-dot type is used to specify dotted normal tuplet types.
public struct TupletDot {
    public let font: Font?
    public let color: Color?

    public init(font: Font? = nil, color: Color? = nil) {
        self.font = font
        self.color = color
    }
}

extension TupletDot: Equatable { }
extension TupletDot: Codable { }
