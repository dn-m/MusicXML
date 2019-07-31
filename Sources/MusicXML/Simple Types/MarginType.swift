//
//  MarginType.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The margin-type type specifies whether margins apply to even page, odd pages, or both.
public enum MarginType: String {
    case odd
    case even
    case both
}

extension MarginType: Equatable { }
extension MarginType: Codable { }
