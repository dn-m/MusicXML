//
//  TupletType.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tuplet-type type indicates the graphical note type of the notes for this portion of the
/// tuplet.
public struct TupletType {
    public let value: NoteTypeValue
    public let font: Font?
    public let color: Color?

    public init(_ value: NoteTypeValue, font: Font? = nil, color: Color? = nil) {
        self.value = value
        self.font = font
        self.color = color
    }
}

extension TupletType: Equatable { }
extension TupletType: Codable { }
