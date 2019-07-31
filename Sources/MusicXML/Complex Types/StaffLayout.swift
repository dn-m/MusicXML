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
}

extension StaffLayout: Equatable { }
extension StaffLayout: Codable { }
