//
//  AccidentalText.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

//// > The accidental-text element is used for exact formatting of
//// > accidentals in display elements such as part-name-display.
//// > Values are the same as for the accidental element.
//// > Enclosure is none by default.
////
//// <!ELEMENT accidental-text (#PCDATA)>
//// <!ATTLIST accidental-text
////    %text-formatting;
////    %smufl;
//// >
//public struct AccidentalText: Decodable, Equatable {
//    let smufl: SMuFL
//    let formatting: TextFormatting
//}

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
}

extension AccidentalText: Equatable { }
extension AccidentalText: Decodable { }
