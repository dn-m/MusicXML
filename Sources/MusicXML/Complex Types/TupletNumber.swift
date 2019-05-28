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
}

extension TupletNumber: Equatable { }
extension TupletNumber: Decodable { }
