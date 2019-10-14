//
//  AccidentalText.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The accidental-text type represents an element with an accidental value and text-formatting
/// attributes.
public struct AccidentalText {
    // MARK: - Attributes
    public let justify: LeftCenterRight?
    public let printStyle: PrintStyle
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?
    public let underline: Int?
    public let overline: Int?
    public let lineThrough: Int?
    public let rotation: Double?
    public let letterSpacing: NumberOrNormal?
    public let lineHeight: NumberOrNormal?
    public let direction: TextDirection?
    public let enclosure: EnclosureShape?

    // MARK: - Elements
    public let value: AccidentalValue

    public init(
        _ value: AccidentalValue,
        justify: LeftCenterRight? = nil,
        printStyle: PrintStyle = PrintStyle(),
        hAlign: LeftCenterRight? = nil,
        vAlign: VAlign? = nil,
        underline: Int? = nil,
        overline: Int? = nil,
        lineThrough: Int? = nil,
        rotation: Double? = nil,
        letterSpacing: NumberOrNormal? = nil,
        lineHeight: NumberOrNormal? = nil,
        direction: TextDirection? = nil,
        enclosure: EnclosureShape? = nil
    ) {
        self.value = value
        self.justify = justify
        self.printStyle = printStyle
        self.hAlign = hAlign
        self.vAlign = vAlign
        self.underline = underline
        self.overline = overline
        self.lineThrough = lineThrough
        self.rotation = rotation
        self.letterSpacing = letterSpacing
        self.lineHeight = lineHeight
        self.direction = direction
        self.enclosure = enclosure
    }
}

extension AccidentalText: Equatable { }
extension AccidentalText: Codable {
    private enum CodingKeys: String, CodingKey {
        case justify
        case hAlign = "halign"
        case vAlign = "valign"
        case underline
        case overline
        case lineThrough = "line-through"
        case rotation
        case letterSpacing = "letter-spacing"
        case lineHeight = "line-height"
        case direction = "dir"
        case enclosure
        case value = ""
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.justify = try container.decodeIfPresent(LeftCenterRight.self, forKey: .justify)
        self.printStyle = try PrintStyle(from: decoder)
        self.hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
        self.vAlign = try container.decodeIfPresent(VAlign.self, forKey: .vAlign)
        self.underline = try container.decodeIfPresent(Int.self, forKey: .underline)
        self.overline = try container.decodeIfPresent(Int.self, forKey: .overline)
        self.lineThrough = try container.decodeIfPresent(Int.self, forKey: .lineThrough)
        self.rotation = try container.decodeIfPresent(Double.self, forKey: .rotation)
        self.letterSpacing = try container.decodeIfPresent(NumberOrNormal.self, forKey: .letterSpacing)
        self.lineHeight = try container.decodeIfPresent(NumberOrNormal.self, forKey: .lineHeight)
        self.direction = try container.decodeIfPresent(TextDirection.self, forKey: .direction)
        self.enclosure = try container.decodeIfPresent(EnclosureShape.self, forKey: .enclosure)
        self.value = try container.decode(AccidentalValue.self, forKey: .value)
    }
}
