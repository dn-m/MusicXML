//
//  Print.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

// > The print element contains general printing parameters,
// > including the layout elements defined in the layout.mod
// > file. The part-name-display and part-abbreviation-display
// > elements used in the score.mod file may also be used here
// > to change how a part name or abbreviation is displayed over
// > the course of a piece. They take effect when the current
// > measure or a succeeding measure starts a new system.
//
// > The new-system and new-page attributes indicate whether
// > to force a system or page break, or to force the current
// > music onto the same system or page as the preceding music.
// > Normally this is the first music data within a measure.
// > If used in multi-part music, they should be placed in the
// > same positions within each part, or the results are
// > undefined. The page-number attribute sets the number of a
// > new page; it is ignored if new-page is not "yes". Version
// > 2.0 adds a blank-page attribute. This is a positive integer
// > value that specifies the number of blank pages to insert
// > before the current measure. It is ignored if new-page is
// > not "yes". These blank pages have no music, but may have
// > text or images specified by the credit element. This is
// > used to allow a combination of pages that are all text,
// > or all text and images, together with pages of music.
// > Staff spacing between multiple staves is measured in
// > tenths of staff lines (e.g. 100 = 10 staff lines). This is
// > deprecated as of Version 1.1; the staff-layout element
// > should be used instead. If both are present, the
// > staff-layout values take priority.
// > Layout elements in a print statement only apply to the
// > current page, system, staff, or measure. Music that
// > follows continues to take the default values from the
// > layout included in the defaults element.
//
// <!ELEMENT print (page-layout?, system-layout?, staff-layout*,
//    measure-layout?, measure-numbering?, part-name-display?,
//    part-abbreviation-display?)>
// <!ATTLIST print
//    staff-spacing %tenths; #IMPLIED
//    new-system %yes-no; #IMPLIED
//    new-page %yes-no; #IMPLIED
//    blank-page NMTOKEN #IMPLIED
//    page-number CDATA #IMPLIED
//    %optional-unique-id;
// >
public struct Print: Codable, Equatable {
    let pageLayout: PageLayout?
    let systemLayout: SystemLayout?
    let measureLayout: MeasureLayout?
    let measureNumbeing: MeasureNumbering?
    let partNameDisplay: NameDisplay?
    let partAbbreviationDisplay: NameDisplay?
    let staffSpacing: Tenths?
    let newSystem: Bool?
    let newPage: Bool?
    let blankPage: Bool?
    let pageNumber: Bool?
    let optionalUniqueID: String

    public init(pageLayout: PageLayout? = nil, systemLayout: SystemLayout? = nil, measureLayout: MeasureLayout? = nil, measureNumbeing: MeasureNumbering? = nil, partNameDisplay: NameDisplay? = nil, partAbbreviationDisplay: NameDisplay? = nil, staffSpacing: Tenths? = nil, newSystem: Bool? = nil, newPage: Bool? = nil, blankPage: Bool? = nil, pageNumber: Bool? = nil, optionalUniqueID: String) {
        self.pageLayout = pageLayout
        self.systemLayout = systemLayout
        self.measureLayout = measureLayout
        self.measureNumbeing = measureNumbeing
        self.partNameDisplay = partNameDisplay
        self.partAbbreviationDisplay = partAbbreviationDisplay
        self.staffSpacing = staffSpacing
        self.newSystem = newSystem
        self.newPage = newPage
        self.blankPage = blankPage
        self.pageNumber = pageNumber
        self.optionalUniqueID = optionalUniqueID
    }
}
