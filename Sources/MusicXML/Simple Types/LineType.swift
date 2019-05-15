//
//  LineType.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The line-type type distinguishes between solid, dashed, dotted, and wavy lines.
public enum LineType: String {
    case solid
    case dashed
    case dotted
    case wavy
}

extension LineType: Equatable { }
extension LineType: Decodable { }
