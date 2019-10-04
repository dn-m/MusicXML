//
//  SystemLayout.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// A system is a group of staves that are read and played simultaneously. System layout includes
/// left and right margins and the vertical distance from the previous system. The system distance
/// is measured from the bottom line of the previous system to the top line of the current system.
/// It is ignored for the first system on a page. The top system distance is measured from the
/// page's top margin to the top line of the first system. It is ignored for all but the first
/// system on a page. Sometimes the sum of measure widths in a system may not equal the system width
/// specified by the layout elements due to roundoff or other errors. The behavior when reading
/// MusicXML files in these cases is application-dependent. For instance, applications may find that
/// the system layout data is more reliable than the sum of the measure widths, and adjust the
/// measure widths accordingly.
public struct SystemLayout {
    public let systemMargins: SystemMargins?
    public let systemDistance: Tenths
    public let topSystemDistance: Int?
    public let systemDividers: SystemDividers?

    public init(systemMargins: SystemMargins? = nil, systemDistance: Tenths, topSystemDistance: Int? = nil, systemDividers: SystemDividers? = nil) {
        self.systemMargins = systemMargins
        self.systemDistance = systemDistance
        self.topSystemDistance = topSystemDistance
        self.systemDividers = systemDividers
    }
}

extension SystemLayout: Equatable { }
extension SystemLayout: Codable { }
