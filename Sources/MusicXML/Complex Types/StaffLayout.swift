//
//  StaffLayout.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// Staff layout includes the vertical distance from the bottom line of the previous staff in this system to the top line of the staff specified by the number attribute.
public struct StaffLayout {
    // MARK: - Instance Properties

    // MAKR: Attributes

    public let number: Int?

    // MARK: Elements

    public let staffDistance: Tenths?

    // MARK: - Initializers

    public init(number: Int? = nil, staffDistance: Tenths? = nil) {
        self.number = number
        self.staffDistance = staffDistance
    }
}

extension StaffLayout: Equatable {}
extension StaffLayout: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case number = "staff-number"
        case staffDistance = "staff-distance"
    }
}

import XMLCoder
extension StaffLayout: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
