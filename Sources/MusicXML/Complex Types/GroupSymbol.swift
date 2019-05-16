//
//  GroupSymbol.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The group-symbol type indicates how the symbol for a group is indicated in the score.
public struct GroupSymbol {
    public let value: GroupSymbolValue
    public let position: Position?
    public let color: Color?
}

extension GroupSymbol: Equatable { }
extension GroupSymbol: Decodable { }
