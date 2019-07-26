//
//  UpDown.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The up-down type is used for the direction of arrows and other pointed symbols like vertical
/// accents, indicating which way the tip is pointing.
public enum UpDown: String {
    case up
    case down
}

extension UpDown: Equatable { }
extension UpDown: Codable { }
