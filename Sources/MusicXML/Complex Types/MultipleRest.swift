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

    // MARK: - Attributes

    public var useSymbols: Bool?

    // MARK: - Value

    public var value: Int

    public init(useSymbols: Bool? = nil, value: Int) {
        self.useSymbols = useSymbols
        self.value = value
    }
}

extension MultipleRest: Equatable { }
extension MultipleRest: Codable { }
