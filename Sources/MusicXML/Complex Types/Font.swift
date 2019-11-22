//
//  Font.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The font attribute group gathers together attributes for determining the font within a credit or
/// direction. They are based on the text styles for Cascading Style Sheets. The font-family is a
/// comma-separated list of font names. These can be specific font styles such as Maestro or Opus,
/// or one of several generic font styles: music, engraved, handwritten, text, serif, sans-serif,
/// handwritten, cursive, fantasy, and monospace. The music, engraved, and handwritten values refer
/// to music fonts; the rest refer to text fonts. The fantasy style refers to decorative text such
/// as found in older German-style printing. The font-style can be normal or italic. The font-size
/// can be one of the CSS sizes (xx-small, x-small, small, medium, large, x-large, xx-large) or a
/// numeric point size. The font-weight can be normal or bold. The default is application-dependent,
/// but is a text font vs. a music font.
public struct Font {
    // MARK: - Instance Properties

    // MARK: - Attributes

    // FIXME: Font.family should be `CommaSeparatedText`
    public let family: String?

    public let style: FontStyle?
    public let size: FontSize?
    public let weight: FontWeight?

    public init(
        family: String? = nil,
        style: FontStyle? = nil,
        size: FontSize? = nil,
        weight: FontWeight? = nil
    ) {
        self.family = family
        self.style = style
        self.size = size
        self.weight = weight
    }
}

extension Font: Equatable {}
extension Font: Codable {
    private enum CodingKeys: String, CodingKey {
        case family = "font-family"
        case style = "font-style"
        case size = "font-size"
        case weight = "font-weight"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(family, forKey: .family)
        try container.encodeIfPresent(style, forKey: .style)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(weight, forKey: .weight)
    }
}
