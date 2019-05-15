//
//  TextDirection.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The text-direction type is used to adjust and override the Unicode bidirectional text algorithm,
/// similar to the W3C Internationalization Tag Set recommendation. Values are ltr (left-to-right
/// embed), rtl (right-to-left embed), lro (left-to-right bidi-override), and rlo (right-to-left
/// bidi-override). The default value is ltr. This type is typically used by applications that store
/// text in left-to-right visual order rather than logical order. Such applications can use the lro
/// value to better communicate with other applications that more fully support bidirectional text.
public enum TextDirection: String {
    case leftToRightEmbed = "ltr"
    case rightToLeftEmbed = "rtl"
    case leftToRightOverride = "lro"
    case rightToLeftOverride = "rlo"
}

extension TextDirection: Equatable { }
extension TextDirection: Decodable { }
