//
//  StaffLayout.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

///Staff layout includes the vertical distance from the bottom line of the previous staff in this system to the top line of the staff specified by the number attribute.
public struct StaffLayout {

    public let number: Int?
    public let staffDistance: Tenths?

    public init(number: Int? = nil, staffDistance: Tenths? = nil) {
        self.number = number
        self.staffDistance = staffDistance
    }
}

extension StaffLayout: Equatable { }
extension StaffLayout: Codable {
    private enum CodingKeys: String, CodingKey {
        case number = "staff-number"
        case staffDistance = "staff-distance"
    }
}
