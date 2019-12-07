//
//  Print.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The print type contains general printing parameters, including the layout elements defined in
/// the layout.mod file. The part-name-display and part-abbreviation-display elements used in the
/// score.mod file may also be used here to change how a part name or abbreviation is displayed over
/// the course of a piece. They take effect when the current measure or a succeeding measure starts
/// a new system. Layout elements in a print statement only apply to the current page, system,
/// staff, or measure. Music that follows continues to take the default values from the layout
/// included in the defaults element.
public struct Print {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let staffSpacing: Tenths?
    public let newSystem: Bool?
    public let newPage: Bool?
    public let blankPage: Int?
    public let pageNumber: String?

    // MARK: Elements

    /// Page layout can be defined both in score-wide defaults and in the print element. Page
    /// margins are specified either for both even and odd pages, or via separate odd and even page
    /// number values. The type is not needed when used as part of a print element. If omitted when
    /// used in the defaults element, "both" is the default.
    public let pageLayout: PageLayout?

    /// A system is a group of staves that are read and played simultaneously. System layout
    /// includes left and right margins and the vertical distance from the previous system. The
    /// system distance is measured from the bottom line of the previous system to the top line of
    /// the current system. It is ignored for the first system on a page. The top system distance is
    /// measured from the page's top margin to the top line of the first system. It is ignored for
    /// all but the first system on a page.
    ///
    /// Sometimes the sum of measure widths in a system may not equal the system width specified by
    /// the layout elements due to roundoff or other errors. The behavior when reading MusicXML
    /// files in these cases is application-dependent. For instance, applications may find that the
    /// system layout data is more reliable than the sum of the measure widths, and adjust the
    /// measure widths accordingly.
    public let systemLayout: SystemLayout?

    /// Staff layout includes the vertical distance from the bottom line of the previous staff in
    /// this system to the top line of the staff specified by the number attribute. The optional
    /// number attribute refers to staff numbers within the part, from top to bottom on the system.
    /// A value of 1 is assumed if not present. When used in the defaults element, the values apply
    /// to all parts. This value is ignored for the first staff in a system.
    public let staffLayout: [StaffLayout]

    /// The measure-layout type includes the horizontal distance from the previous measure.
    public let measureLayout: MeasureLayout?

    /// The measure-numbering type describes how frequently measure numbers are displayed on this
    /// part. The number attribute from the measure element is used for printing. Measures with an
    /// implicit attribute set to "yes" never display a measure number, regardless of the
    /// measure-numbering setting.
    public let measureNumbering: MeasureNumbering?

    /// The part-name-display and part-abbreviation-display elements used in the score.mod file may
    /// also be used here to change how a part name or abbreviation is displayed over the course of
    /// a piece. They take effect when the current measure or a succeeding measure starts a new
    /// system.
    public let partNameDisplay: NameDisplay?

    /// The part-name-display and part-abbreviation-display elements used in the score.mod file may
    /// also be used here to change how a part name or abbreviation is displayed over the course of
    /// a piece. They take effect when the current measure or a succeeding measure starts a new
    /// system.
    public let partAbbreviationDisplay: NameDisplay?

    // MARK: - Initializers

    public init(
        pageLayout: PageLayout? = nil,
        systemLayout: SystemLayout? = nil,
        staffLayout: [StaffLayout] = [],
        measureLayout: MeasureLayout? = nil,
        measureNumbering: MeasureNumbering? = nil,
        partNameDisplay: NameDisplay? = nil,
        partAbbreviationDisplay: NameDisplay? = nil,
        staffSpacing: Tenths? = nil,
        newSystem: Bool? = nil,
        newPage: Bool? = nil,
        blankPage: Int? = nil,
        pageNumber: String? = nil
    ) {
        self.pageLayout = pageLayout
        self.systemLayout = systemLayout
        self.staffLayout = staffLayout
        self.measureLayout = measureLayout
        self.measureNumbering = measureNumbering
        self.partNameDisplay = partNameDisplay
        self.partAbbreviationDisplay = partAbbreviationDisplay
        self.staffSpacing = staffSpacing
        self.newSystem = newSystem
        self.newPage = newPage
        self.blankPage = blankPage
        self.pageNumber = pageNumber
    }
}

extension Print: Equatable {}

extension Print: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case pageLayout = "page-layout"
        case systemLayout = "system-layout"
        case staffLayout = "staff-layout"
        case measureLayout = "measure-layout"
        case measureNumbering = "measure-numbering"
        case partNameDisplay = "part-name-display"
        case partAbbreviationDisplay = "part-abbreviation-display"
        case staffSpacing = "staff-spacing"
        case newSystem = "new-system"
        case newPage = "new-page"
        case blankPage = "blank-page"
        case pageNumber = "page-number"
    }
}

import XMLCoder
// sourcery:inline:Print.DynamicNodeEncoding
extension Print: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.staffSpacing:
            return .attribute
        case CodingKeys.newSystem:
            return .attribute
        case CodingKeys.newPage:
            return .attribute
        case CodingKeys.blankPage:
            return .attribute
        case CodingKeys.pageNumber:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end
