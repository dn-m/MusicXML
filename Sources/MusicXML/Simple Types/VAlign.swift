//
//  VAlign.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The valign type is used to indicate vertical alignment to the top, middle, bottom, or baseline
/// of the text. Defaults are implementation-dependent.
public enum VAlign: String {
    case top
    case middle
    case bottom
    case baseline
}

extension VAlign: Equatable { }
extension VAlign: Decodable { }
