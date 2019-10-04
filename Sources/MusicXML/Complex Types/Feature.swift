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
    public let value: String
    public let type: String?

    public init(value: String, type: String? = nil) {
        self.value = value
        self.type = type
    }
}

extension Feature: Equatable { }
extension Feature: Codable { }
