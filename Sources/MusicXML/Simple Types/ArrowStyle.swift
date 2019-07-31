//
//  ArrowStyle.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The arrow-style type represents the style of an arrow, using Unicode arrow terminology. Filled
/// and hollow arrows indicate polygonal single arrows. Paired arrows are duplicate single arrows in
/// the same direction. Combined arrows apply to double direction arrows like left right, indicating
/// that an arrow in one direction should be combined with an arrow in the other direction.
public enum ArrowStyle: String {
    case single
    case double
    case filled
    case hollow
    case paired
    case combined
    case other
}

extension ArrowStyle: Equatable { }
extension ArrowStyle: Codable { }
