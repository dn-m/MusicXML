//
//  SystemMargins.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// System margins are relative to the page margins. Positive values indent and negative values
/// reduce the margin size.
public struct SystemMargins {
    // MARK: - Instance Properties

    // MARK: Elements

    public let left: Tenths
    public let right: Tenths

    // MARK: - Initializers

    public init(left: Tenths, right: Tenths) {
        self.left = left
        self.right = right
    }
}

extension SystemMargins: Equatable {}
extension SystemMargins: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case left = "left-margin"
        case right = "right-margin"
    }
}

import XMLCoder
// sourcery:inline:SystemMargins.DynamicNodeEncoding
extension SystemMargins: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end
