//
//  EmptyLine.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-line type represents an empty element with line-shape, line-type, dashed-formatting,
/// print-style and placement attributes.
public struct EmptyLine {
    public var lineShape: LineShape?
    public var lineType: LineType?
    public var dashedFormatting: DashedFormatting?
    public var position: Position?
    public var printStyle: PrintStyle?
    public var placement: AboveBelow?
}

extension EmptyLine: Equatable { }
extension EmptyLine: Codable { }
