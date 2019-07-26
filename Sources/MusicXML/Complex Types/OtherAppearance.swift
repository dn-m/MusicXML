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
}

extension OtherAppearance: Equatable { }
extension OtherAppearance: Codable { }
