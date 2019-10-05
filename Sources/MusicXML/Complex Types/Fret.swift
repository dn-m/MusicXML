//
//  Fret.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The fret element is used with tablature notation and chord diagrams. Fret numbers start with 0
/// for an open string and 1 for the first fret.
public struct Fret {
    public let value: Int
    public let font: Font?
    public let color: Color?

    public init(value: Int, font: Font? = nil, color: Color? = nil) {
        self.value = value
        self.font = font
        self.color = color
    }
}

extension Fret: Equatable { }
extension Fret: Codable { }
