//
//  DegreeSymbolValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The degree-symbol-value type indicates indicates that a symbol should be used in specifying the
/// degree.
public enum DegreeSymbolValue: String {
    case major
    case minor
    case augmented
    case diminished
    case halfDiminished = "half-diminished"
}

extension DegreeSymbolValue: Equatable { }
extension DegreeSymbolValue: Codable { }
