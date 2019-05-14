//
//  FontWeight.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The font-weight type represents a simplified version of the CSS font-weight property.
enum FontWeight: String {
    case normal
    case bold
}

extension FontWeight: Equatable { }
extension FontWeight: Decodable { }
