//
//  Feature.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The feature type is a part of the grouping element used for musical analysis. The type attribute
/// represents the type of the feature and the element content represents its value. This type is
/// flexible to allow for different analyses.
public struct Feature {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: String

    // MARK: Attributes

    public let type: String?

    // MARK: - Initializers

    public init(_ value: String, type: String? = nil) {
        self.value = value
        self.type = type
    }
}

extension Feature: Equatable {}
extension Feature: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case value = ""
    }
}

import XMLCoder
extension Feature: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
