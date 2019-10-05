//
//  AccidentalText.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The accidental-text type represents an element with an accidental value and text-formatting
/// attributes.
public struct AccidentalText {
    public let justify: LeftCenterRight?
    public let defaultX: Double?
    public let defaultY: Double?
    public let relativeX: Double?
    public let relativeY: Double?
    public let fontFamily: CommaSeparatedText?
    public let fontSize: FontSize?
    public let fontStyle: FontStyle?
    public let fontWeight: FontWeight?
    public let color: Color?
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?
    public let underline: Int? // number-of-lines
    public let overline: Int? // number-of-lines
    public let lineThrough: Int? // number-of-lines
    public let rotation: Double? // rotation-degrees
    public let letterSpacing: NumberOrNormal?
    public let lineHeight: NumberOrNormal?
    public let dir: TextDirection?
    public let enclosureShape: EnclosureShape?

    public init(justify: LeftCenterRight? = nil, defaultX: Double? = nil, defaultY: Double? = nil, relativeX: Double? = nil, relativeY: Double? = nil, fontFamily: CommaSeparatedText? = nil, fontSize: FontSize? = nil, fontStyle: FontStyle? = nil, fontWeight: FontWeight? = nil, color: Color? = nil, hAlign: LeftCenterRight? = nil, vAlign: VAlign? = nil, underline: Int? = nil, overline: Int? = nil, lineThrough: Int? = nil, rotation: Double? = nil, letterSpacing: NumberOrNormal? = nil, lineHeight: NumberOrNormal? = nil, dir: TextDirection? = nil, enclosureShape: EnclosureShape? = nil) {
        self.justify = justify
        self.defaultX = defaultX
        self.defaultY = defaultY
        self.relativeX = relativeX
        self.relativeY = relativeY
        self.fontFamily = fontFamily
        self.fontSize = fontSize
        self.fontStyle = fontStyle
        self.fontWeight = fontWeight
        self.color = color
        self.hAlign = hAlign
        self.vAlign = vAlign
        self.underline = underline
        self.overline = overline
        self.lineThrough = lineThrough
        self.rotation = rotation
        self.letterSpacing = letterSpacing
        self.lineHeight = lineHeight
        self.dir = dir
        self.enclosureShape = enclosureShape
    }
}

extension AccidentalText: Equatable { }
extension AccidentalText: Codable { }
