//
//  FormattedText.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The formatted-text type represents a text element with text-formatting attributes.
public struct FormattedText {
    public let justify: LeftCenterRight
    public let position: Position
    public let printStyle: PrintStyle
    public let hAlign: LeftCenterRight
    public let vAlign: VAlign
    public let underline: Int
    public let overline: Int
    public let lineThrough: Int
    public let rotation: Double
    public let letterSpacing: NumberOrNormal
    public let lineHeight: NumberOrNormal
    public let dir: TextDirection
    public let enclosure: EnclosureShape

    public init(justify: LeftCenterRight, position: Position, printStyle: PrintStyle, hAlign: LeftCenterRight, vAlign: VAlign, underline: Int, overline: Int, lineThrough: Int, rotation: Double, letterSpacing: NumberOrNormal, lineHeight: NumberOrNormal, dir: TextDirection, enclosure: EnclosureShape) {
        self.justify = justify
        self.position = position
        self.printStyle = printStyle
        self.hAlign = hAlign
        self.vAlign = vAlign
        self.underline = underline
        self.overline = overline
        self.lineThrough = lineThrough
        self.rotation = rotation
        self.letterSpacing = letterSpacing
        self.lineHeight = lineHeight
        self.dir = dir
        self.enclosure = enclosure
    }
}

extension FormattedText: Equatable { }
extension FormattedText: Codable { }
