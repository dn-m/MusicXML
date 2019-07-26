//
//  OverUnder.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The over-under type is used to indicate whether the tips of curved lines such as slurs and ties
/// are overhand (tips down) or underhand (tips up).
public enum OverUnder: String {
    case over
    case under
}

extension OverUnder: Equatable { }
extension OverUnder: Codable { }
