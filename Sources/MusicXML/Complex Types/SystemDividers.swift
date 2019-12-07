//
//  SystemDividers.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The system-dividers element indicates the presence or absence of system dividers (also known as
/// system separation marks) between systems displayed on the same page. Dividers on the left and
/// right side of the page are controlled by the left-divider and right-divider elements
/// respectively. The default vertical position is half the system-distance value from the top of
/// the system that is below the divider. The default horizontal position is the left and right
/// system margin, respectively.  When used in the print element, the system-dividers element
/// affects the dividers that would appear between the current system and the previous system.
public struct SystemDividers {
    // MARK: - Instance Properties

    // MARK: Attribute Groups

    public let left: PrintStyleAlignObject
    public let right: PrintStyleAlignObject

    // MARK: - Initializers

    public init(left: PrintStyleAlignObject, right: PrintStyleAlignObject) {
        self.left = left
        self.right = right
    }
}

extension SystemDividers: Equatable {}
extension SystemDividers: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case left = "left-divider"
        case right = "right-divider"
    }
}

import XMLCoder
// sourcery:inline:SystemDividers.DynamicNodeEncoding
extension SystemDividers: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end
