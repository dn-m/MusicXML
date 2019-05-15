//
//  SymbolSize.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The symbol-size type is used to indicate full vs. cue-sized vs. oversized symbols. The large
/// value for oversized symbols was added in version 1.1.
public enum SymbolSize: String {
    case full
    case cue
    case large
}

extension SymbolSize: Equatable { }
extension SymbolSize: Decodable { }
