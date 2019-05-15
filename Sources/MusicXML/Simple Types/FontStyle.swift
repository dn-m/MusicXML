//
//  FontStyle.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The font-style type represents a simplified version of the CSS font-style property.
enum FontStyle: String {
    case normal
    case italic
}

extension FontStyle: Equatable { }
extension FontStyle: Decodable { }
