//
//  LineWidth.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

public struct LineWidth {
    public let value: Tenths
    public let type: LineWidthType
}

extension LineWidth: Equatable { }
extension LineWidth: Decodable { }
