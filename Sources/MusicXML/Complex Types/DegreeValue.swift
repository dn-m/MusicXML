//
//  DegreeValue.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The content of the degree-value type is a number indicating the degree of the chord (1 for the
/// root, 3 for third, etc). The text attribute specifies how the type of the degree should be
/// displayed in a score. The degree-value symbol attribute indicates that a symbol should be used
/// in specifying the degree. If the symbol attribute is present, the value of the text attribute
/// follows the symbol.
public struct DegreeValue {
    public let value: Int
    public let symbol: DegreeSymbolValue?
    public let text: String?
    public let printStyle: PrintStyle?
}

extension DegreeValue: Equatable { }
extension DegreeValue: Codable { }
