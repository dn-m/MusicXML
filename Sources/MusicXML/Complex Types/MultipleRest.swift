//
//  MultipleRest.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The text of the multiple-rest type indicates the number of measures in the multiple rest.
/// Multiple rests may use the 1-bar / 2-bar / 4-bar rest symbols, or a single shape. The element
/// text is ignored when the type is stop.
public struct MultipleRest {
    public let count: Int
    public let useSymbols: Bool
}

extension MultipleRest: Equatable { }
extension MultipleRest: Codable { }
