//
//  Justify.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The justify attribute is used to indicate left, center, or right justification. The default
/// value varies for different elements. For elements where the justify attribute is present but the
/// halign attribute is not, the justify attribute indicates horizontal alignment as well as
/// justification.
public enum Justify: String {
    case left
    case center
    case right
}

extension Justify: Equatable {}
extension Justify: Codable {}
