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

    public init(lineShape: LineShape? = nil, lineType: LineType? = nil, dashedFormatting: DashedFormatting? = nil, position: Position? = nil, printStyle: PrintStyle? = nil, placement: AboveBelow? = nil) {
        self.lineShape = lineShape
        self.lineType = lineType
        self.dashedFormatting = dashedFormatting
        self.position = position
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension EmptyLine: Equatable { }
extension EmptyLine: Codable { }
