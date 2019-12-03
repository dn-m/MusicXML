//
//  HoleClosed.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The hole-closed type represents whether the hole is closed, open, or half-open.
public struct HoleClosed {
    // MARK: - Instance Properties

    public let value: HoleClosedValue
    /// The optional location attribute indicates which portion of the hole is filled in when the
    /// element value is half.
    public let location: HoleClosedLocation?

    public init(_ value: HoleClosedValue, location: HoleClosedLocation? = nil) {
        self.value = value
        self.location = location
    }
}

extension HoleClosed: Equatable {}
extension HoleClosed: Codable {
    enum CodingKeys: String, CodingKey {
        case location
        case value = ""
    }
}

import XMLCoder
extension HoleClosed: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
