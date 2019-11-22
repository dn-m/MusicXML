//
//  TopBottom.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The top-bottom type is used to indicate the top or bottom part of a vertical shape like
/// non-arpeggiate.
public enum TopBottom: String {
    case top
    case bottom
}

extension TopBottom: Equatable {}
extension TopBottom: Codable {}
