//
//  GroupSymbol.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

import XMLCoder

/// The group-symbol type indicates how the symbol for a group is indicated in the score.
public struct GroupSymbol {
    public var value: GroupSymbolValue
    public var position: Position?
    public var color: Color?
}

extension GroupSymbol: Equatable { }
extension GroupSymbol: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case position
        case color
    }
}
