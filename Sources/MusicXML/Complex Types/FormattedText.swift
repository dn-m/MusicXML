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
}

extension FormattedText: Equatable { }
extension FormattedText: Decodable { }
