//
//  AboveBelow.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The above-below type is used to indicate whether one element appears above or below another
/// element.
public enum AboveBelow: String {
    case above
    case below
}

extension AboveBelow: Equatable {}
extension AboveBelow: Codable {}
