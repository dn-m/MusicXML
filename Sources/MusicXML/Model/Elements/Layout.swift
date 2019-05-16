//
//  Layout.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//

// > Margins, page sizes, and distances are all measured in
// > tenths to keep MusicXML data in a consistent coordinate
// > system as much as possible. The translation to absolute
// > units is done in the scaling element, which specifies
// > how many millimeters are equal to how many tenths. For
// > a staff height of 7 mm, millimeters would be set to 7
// > while tenths is set to 40. The ability to set a formula
// > rather than a single scaling factor helps avoid roundoff
// > errors.
//
// <!ELEMENT scaling (millimeters, tenths)>
// <!ELEMENT millimeters (#PCDATA)>
// <!ELEMENT tenths %layout-tenths;>
public struct Scaling: Decodable, Equatable {
    let millimeters: Int
    let tenths: Int
}

// > Page layout can be defined both in score-wide defaults
// > and in the print element. Page margins are specified either
// > for both even and odd pages, or via separate odd and even
// > page number values. The type is not needed when used as
// > part of a print element. If omitted when used in the
// > defaults element, "both" is the default.
//
// <!ELEMENT page-layout ((page-height, page-width)?,
//    (page-margins, page-margins?)?)>
public struct PageLayout: Decodable, Equatable {

    public struct Size: Decodable, Equatable {
        // <!ELEMENT page-height %layout-tenths;>
        let height: Tenths
        // <!ELEMENT page-width %layout-tenths;>
        let width: Tenths
    }

    #warning("FIXME: Refactor Margins a little better to encode logic")
    public struct Margins: Decodable, Equatable {
        let even: PageMargins
        let odd: PageMargins?
    }

    let size: Size?
    let margins: Margins?
}

// <!ELEMENT page-margins (left-margin, right-margin,
//    top-margin, bottom-margin)>
// <!ATTLIST page-margins
//    type (odd | even | both) #IMPLIED
// >
public struct PageMargins: Decodable, Equatable {
    public enum Kind: String, Decodable, Equatable {
        case odd
        case even
        case both
    }
    let kind: Kind
    let left: Tenths
    let right: Tenths
    let top: Tenths
    let bottom: Tenths
}


//
//<!--
//    MusicXML layout.mod module
//
//    Version 3.1
//
//    Copyright © 2004-2017 the Contributors to the MusicXML
//    Specification, published by the W3C Music Notation Community
//    Group under the W3C Community Final Specification Agreement
//    (FSA):
//
//       https://www.w3.org/community/about/agreements/final/
//
//    A human-readable summary is available:
//
//       https://www.w3.org/community/about/agreements/fsa-deed/
//-->
//
//<!--
//    Version 1.1 of the MusicXML format added layout information
//    for pages, systems, staffs, and measures. These layout
//    elements joined the print and sound elements in providing
//    formatting data as elements rather than attributes.
//
//    Everything is measured in tenths of staff space. Tenths are
//    then scaled to millimeters within the scaling element, used
//    in the defaults element at the start of a score. Individual
//    staves can apply a scaling factor to adjust staff size.
//    When a MusicXML element or attribute refers to tenths,
//    it means the global tenths defined by the scaling element,
//    not the local tenths as adjusted by the staff-size element.

// MARK: - Elements

//    Margin elements are included within many of the larger
//    layout elements.
//
//<!ELEMENT left-margin %layout-tenths;>
//<!ELEMENT right-margin %layout-tenths;>
//<!ELEMENT top-margin %layout-tenths;>
//<!ELEMENT bottom-margin %layout-tenths;>




// <!ELEMENT system-margins (left-margin, right-margin)>
// <!ELEMENT system-distance %layout-tenths;>
// <!ELEMENT top-system-distance %layout-tenths;>
public struct SystemMargins: Decodable, Equatable {
    let left: Tenths
    let right: Tenths
}

//    The system-dividers element indicates the presence or
//    absence of system dividers (also known as system separation
//    marks) between systems displayed on the same page. Dividers
//    on the left and right side of the page are controlled by
//    the left-divider and right-divider elements respectively.
//    The default vertical position is half the system-distance
//    value from the top of the system that is below the divider.
//    The default horizontal position is the left and right
//    system margin, respectively.
//    When used in the print element, the system-dividers element
//    affects the dividers that would appear between the current
//    system and the previous system.
//
// <!ELEMENT system-dividers (left-divider, right-divider)>
public struct SystemDividers: Decodable, Equatable {
    let left: Divider
    let right: Divider
}

// <!ELEMENT left-divider EMPTY>
// <!ATTLIST left-divider
//    %print-object;
//    %print-style-align;
// >
// <!ELEMENT right-divider EMPTY>
// <!ATTLIST right-divider
//    %print-object;
//    %print-style-align;
// >
public struct Divider: Decodable, Equatable {
    let printObject: Bool?
    let printStyleAlignment: PrintStyleAlign?
}

