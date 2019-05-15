//
//  TimeRelation.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The time-relation type indicates the symbol used to represent the interchangeable aspect of dual
/// time signatures.
public enum TimeRelation: String {
    case parentheses
    case bracket
    case equals
    case slash
    case space
    case hyphen
}

extension TimeRelation: Equatable { }
extension TimeRelation: Decodable { }
