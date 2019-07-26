//
//  HarmonyType.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The harmony-type type differentiates different types of harmonies when alternate harmonies are
/// possible. Explicit harmonies have all notes present in the music; implied have some notes
/// missing but implied; alternate represents alternate analyses.
public enum HarmonyType: String {
    case explicit
    case implied
    case alternate
}

extension HarmonyType: Equatable { }
extension HarmonyType: Codable { }
