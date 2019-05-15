//
//  EmptyLine.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-line type represents an empty element with line-shape, line-type, dashed-formatting,
/// print-style and placement attributes.
public struct EmptyLine {
    public let lineShape: LineShape
    public let lineType: LineType
    public let dashLength: Tenths
    public let spaceLength: Tenths
    public let position: Position
    public let printStyle: PrintStyle
    public let placement: AboveBelow
}

extension EmptyLine: Equatable { }
extension EmptyLine: Decodable { }
