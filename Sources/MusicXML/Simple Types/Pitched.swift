//
//  Pitched.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The pitched type represents pictograms for pitched percussion instruments. The chimes and
/// tubular chimes values distinguish the single-line and double-line versions of the pictogram. The
/// mallet value is in addition to Stone's list.
public enum Pitched: String {
    case chimes
    case glockenspiel
    case mallet
    case marimba
    case tubularChimes = "tubular chimes"
    case vibraphone
    case xylophone
}

extension Pitched: Equatable { }
extension Pitched: Codable { }
