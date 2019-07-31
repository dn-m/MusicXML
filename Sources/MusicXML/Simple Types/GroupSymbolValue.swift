//
//  GroupSymbolValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The group-symbol-value type indicates how the symbol for a group is indicated in the score. The
/// default value is none.
public enum GroupSymbolValue: String {
    case none
    case brace
    case line
    case bracket
    case square
}

extension GroupSymbolValue: Equatable { }
extension GroupSymbolValue: Codable { }
