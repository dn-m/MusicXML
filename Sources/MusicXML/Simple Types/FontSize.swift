//
//  FontSize.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The font-size can be one of the CSS font sizes or a numeric point size.
public enum FontSize {
    case css(CSSFontSize)
    case numeric(Double)
}

extension FontSize: Equatable { }

#warning("TODO: Implement FontSize: Decodable conformance")
extension FontSize: Decodable {
    public init(from decoder: Decoder) throws {
        fatalError("TODO: FontSize.init(from: Decoder) not yet implemented!")
    }
}
