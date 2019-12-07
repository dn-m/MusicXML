//
//  Grouping.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The grouping type is used for musical analysis. When the type attribute is "start" or "single",
/// it usually contains one or more feature elements. Feature elements contained within a "stop"
/// type of grouping may be ignored. This element is flexible to allow for different types of
/// analyses. Future versions of the MusicXML format may add elements that can represent more
/// standardized categories of analysis data, allowing for easier data sharing.
public struct Grouping {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: StartStopSingle
    /// The number attribute is used for distinguishing between overlapping and hierarchical
    /// groupings.
    public let number: Int?
    public let memberOf: String?

    // MARK: Elements

    public let feature: [Feature]

    // MARK: - Initializers

    public init(type: StartStopSingle, feature: [Feature], number: Int? = nil, memberOf: String? = nil) {
        self.type = type
        self.feature = feature
        self.number = number
        self.memberOf = memberOf
    }
}

extension Grouping: Equatable {}
extension Grouping: Codable {}

import XMLCoder
// sourcery:inline:Grouping.DynamicNodeEncoding
extension Grouping: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.number:
            return .attribute
        case CodingKeys.memberOf:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end
