//
//  LineWidth.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The line-width type indicates the width of a line type in tenths. The text content is also
/// expressed in tenths.
public struct LineWidth {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: Tenths

    // MARK: Attributes

    public let type: LineWidthType

    // MARK: - Initializers

    public init(_ value: Tenths, type: LineWidthType) {
        self.value = value
        self.type = type
    }
}

extension LineWidth: Equatable {}
extension LineWidth: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case value = ""
    }
}

import XMLCoder
extension LineWidth: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
