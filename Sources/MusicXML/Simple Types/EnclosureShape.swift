//
//  EnclosureShape.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The enclosure-shape entity describes the shape and presence / absence of an enclosure around
/// text. A bracket enclosure is similar to a rectangle with the bottom line missing, as is common
/// in jazz notation.
public enum EnclosureShape: String {
    case rectangle
    case square
    case oval
    case circle
    case bracket
    case triangle
    case diamond
    case pentagon
    case hexagon
    case heptagon
    case octagon
    case nonagon
    case decagon
    case none
}

extension EnclosureShape: Equatable { }
extension EnclosureShape: Codable { }
