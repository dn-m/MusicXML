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
    // MARK: - Instance Properties

    // MARK: Attributes

    public var useSymbols: Bool?

    // MARK: Value

    public var value: Int

    // MARK: - Initializers

    public init(_ value: Int, useSymbols: Bool? = nil) {
        self.value = value
        self.useSymbols = useSymbols
    }
}

extension MultipleRest: Equatable {}
extension MultipleRest: Codable {
    enum CodingKeys: String, CodingKey {
        case useSymbols
        case value = ""
    }
}

import XMLCoder
extension MultipleRest: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
