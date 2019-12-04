//
//  Distance.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The distance element represents standard distances between notation elements in tenths.
public struct Distance {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: Tenths

    // MARK: Attributes

    public let type: DistanceType

    // MARK: - Initializers

    public init(_ value: Tenths, type: DistanceType) {
        self.value = value
        self.type = type
    }
}

extension Distance: Equatable {}
extension Distance: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case value = ""
    }
}

import XMLCoder
extension Distance: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
