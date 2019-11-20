//
//  BreathMarkValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The breath-mark-value type represents the symbol used for a breath mark.
public enum BreathMarkValue: String {
    case comma
    case tick
    case `default` = ""
}

extension BreathMarkValue: Equatable {}
extension BreathMarkValue: Codable {}
