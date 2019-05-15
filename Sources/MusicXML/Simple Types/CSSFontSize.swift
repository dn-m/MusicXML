//
//  CSSFontSize.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The css-font-size type includes the CSS font sizes used as an alternative to a numeric point
/// size.
public enum CSSFontSize: String {
    case xxSmall = "xx-small"
    case xSmall = "x-small"
    case small
    case medium
    case large
    case xLarge = "x-large"
    case xxLarge = "xx-large"
}

extension CSSFontSize: Equatable { }
extension CSSFontSize: Decodable { }
