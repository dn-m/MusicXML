//
//  TrillStep.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The trill-step type describes the alternating note of trills and mordents for playback, relative
/// to the current note.
public enum TrillStep: String {
    case whole
    case half
    case unison
}

extension TrillStep: Equatable { }
extension TrillStep: Decodable { }
