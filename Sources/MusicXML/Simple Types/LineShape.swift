//
//  LineShape.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The line-shape type distinguishes between straight and curved lines.
public enum LineShape: String {
    case straight
    case curved
}

extension LineShape: Equatable { }
extension LineShape: Decodable { }
