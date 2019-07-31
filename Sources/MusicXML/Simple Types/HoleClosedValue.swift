//
//  HoleClosedValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The hole-closed-value type represents whether the hole is closed, open, or half-open.
public enum HoleClosedValue: String {
    case yes
    case no
    case half
}

extension HoleClosedValue: Equatable { }
extension HoleClosedValue: Codable { }
