//
//  OtherAppearance.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The other-appearance type is used to define any graphical settings not yet in the current
/// version of the MusicXML format. This allows extended representation, though without application
/// interoperability.
public struct OtherAppearance {
    // MARK: - Instance Properties

    public let value: String
    public let type: String

    // MARK - Initializers

    public init(_ value: String, type: String) {
        self.value = value
        self.type = type
    }
}

extension OtherAppearance: Equatable {}
extension OtherAppearance: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case value = ""
    }
}

import XMLCoder
extension OtherAppearance: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
