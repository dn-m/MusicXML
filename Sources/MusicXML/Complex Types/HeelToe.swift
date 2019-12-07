//
//  HeelToe.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The heel and toe elements are used with organ pedals.
public struct HeelToe {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let placement: AboveBelow?
    public let substitution: Bool?

    // FIXME: Add Attribute Groups

    // MARK: - Initializers

    public init(placement: AboveBelow? = nil, substitution: Bool? = nil) {
        self.placement = placement
        self.substitution = substitution
    }
}

extension HeelToe: Equatable {}
extension HeelToe: Codable {}

import XMLCoder
extension HeelToe: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.placement:
            return .attribute
        case CodingKeys.substitution:
            return .attribute
        default:
        return .element
        }
    }
}
