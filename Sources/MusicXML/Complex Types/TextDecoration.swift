//
//  TextDecoration.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The text-decoration attribute group is based on the similar feature in XHTML and CSS. It allows
/// for text to be underlined, overlined, or struck-through. It extends the CSS version by allow
/// double or triple lines instead of just being on or off.
public struct TextDecoration {
    public let underline: Int?
    public let overline: Int?
    public let lineThrough: Int?

    public init(underline: Int? = nil, overline: Int? = nil, lineThrough: Int? = nil) {
        self.underline = underline
        self.overline = overline
        self.lineThrough = lineThrough
    }
}

extension TextDecoration: Equatable {}
extension TextDecoration: Codable {}
