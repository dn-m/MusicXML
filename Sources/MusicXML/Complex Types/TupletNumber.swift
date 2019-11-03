//
//  TupletNumber.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tuplet-number type indicates the number of notes for this portion of the tuplet.
public struct TupletNumber {
    public let value: Int
    public let font: Font?
    public let color: Color?

    public init(_ value: Int, font: Font? = nil, color: Color? = nil) {
        self.value = value
        self.font = font
        self.color = color
    }
}

extension TupletNumber: Equatable { }
extension TupletNumber: Codable {
    // sourcery:inline:TupletNumber.ExplicitCodingKey
    enum CodingKeys: String, CodingKey {
        case font
        case color
        case value = ""
    }
    // sourcery:end
}
