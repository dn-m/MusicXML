//
//  Scaling.swift
//  MusicXML
//
//  Created by James Bean on 10/16/19.
//

/// Margins, page sizes, and distances are all measured in tenths to keep MusicXML data in a
/// consistent coordinate system as much as possible. The translation to absolute units is done with
/// the scaling type, which specifies how many millimeters are equal to how many tenths. For a staff
/// height of 7 mm, millimeters would be set to 7 while tenths is set to 40. The ability to set a
/// formula rather than a single scaling factor helps avoid roundoff errors.
public struct Scaling {
    // MARK: - Instance Properties

    // MARK: Elements

    /// The millimeters type is a number representing millimeters. This is used in the scaling
    /// element to provide a default scaling from tenths to physical units.
    public let millimeters: Double

    /// The tenths type is a number representing tenths of interline staff space (positive or
    /// negative). Both integer and decimal values are allowed, such as 5 for a half space and 2.5
    /// for a quarter space. Interline space is measured from the middle of a staff line. Distances
    /// in a MusicXML file are measured in tenths of staff space. Tenths are then scaled to
    /// millimeters within the scaling element, used in the defaults element at the start of a
    /// score. Individual staves can apply a scaling factor to adjust staff size. When a MusicXML
    /// element or attribute refers to tenths, it means the global tenths defined by the scaling
    /// element, not the local tenths as adjusted by the staff-size element.
    public let tenths: Tenths

    // MARK: - Initializers

    public init(millimeters: Double, tenths: Tenths) {
        self.millimeters = millimeters
        self.tenths = tenths
    }
}

extension Scaling: Equatable {}
extension Scaling: Codable {}

import XMLCoder
extension Scaling: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
