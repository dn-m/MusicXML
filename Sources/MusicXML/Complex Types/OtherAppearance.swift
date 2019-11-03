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
    public let value: String
    public let type: String

    public init(_ value: String, type: String) {
        self.value = value
        self.type = type
    }
}

extension OtherAppearance: Equatable { }
extension OtherAppearance: Codable {
    // sourcery:inline:OtherAppearance.ExplicitCodingKey
    enum CodingKeys: String, CodingKey {
        case type
        case value = ""
    }
    // sourcery:end
}
