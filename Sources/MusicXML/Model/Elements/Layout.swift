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

//<!--
//    Staff layout includes the vertical distance from the bottom
//    line of the previous staff in this system to the top line
//    of the staff specified by the number attribute. The
//    optional number attribute refers to staff numbers within
//    the part, from top to bottom on the system. A value of 1
//    is assumed if not present. When used in the defaults
//    element, the values apply to all parts. This value is
//    ignored for the first staff in a system.
//-->
//<!ELEMENT staff-layout (staff-distance?)>
//<!ELEMENT staff-distance %layout-tenths;>
//<!ATTLIST staff-layout
//    number CDATA #IMPLIED
//>

// > Measure layout includes the horizontal distance from the
// > previous measure. This value is only used for systems
// > where there is horizontal whitespace in the middle of a
// > system, as in systems with codas. To specify the measure
// > width, use the width attribute of the measure element.
//
//<!ELEMENT measure-layout (measure-distance?)>
//<!ELEMENT measure-distance %layout-tenths;>
public struct MeasureLayout: Decodable, Equatable {
    let distance: Int // layout-tenths
}

//<!--
//    The appearance element controls general graphical
//    settings for the music's final form appearance on a
//    printed page of display. This includes support
//    for line widths, definitions for note sizes, and standard
//    distances between notation elements, plus an extension
//    element for other aspects of appearance.
//
//    The line-width element indicates the width of a line type
//    in tenths. The type attribute defines what type of line is
//    being defined. Values include beam, bracket, dashes,
//    enclosure, ending, extend, heavy barline, leger,
//    light barline, octave shift, pedal, slur middle, slur tip,
//    staff, stem, tie middle, tie tip, tuplet bracket, and
//    wedge. The text content is expressed in tenths.
//
//    The note-size element indicates the percentage of the
//    regular note size to use for notes with a cue and large
//    size as defined in the type element. The grace-cue type
//    is used for notes of grace-cue size. The grace type is
//    used for notes of cue size that include a grace element.
//    The cue type is used for all other notes with cue size,
//    whether defined explicitly or implicitly via a cue element.
//    The large type is used for notes of large size. The text
//    content represent the numeric percentage. A value of 100
//    would be identical to the size of a regular note as defined
//    by the music font.
//
//    The distance element represents standard distances between
//    notation elements in tenths. The type attribute defines what
//    type of distance is being defined. Values include hyphen
//    (for hyphens in lyrics) and beam.
//
//    The glyph element represents what SMuFL glyph should be used
//    for different variations of symbols that are semantically
//    identical. The type attribute specifies what type of glyph
//    is being defined. The element value specifies what
//    SMuFL glyph to use, including recommended stylistic
//    alternates.
//
//    Glyph type attribute values include quarter-rest,
//    g-clef-ottava-bassa, c-clef, f-clef, percussion-clef,
//    octave-shift-up-8, octave-shift-down-8,
//    octave-shift-continue-8, octave-shift-down-15,
//    octave-shift-up-15, octave-shift-continue-15,
//    octave-shift-down-22, octave-shift-up-22, and
//    octave-shift-continue-22. A quarter-rest type specifies the
//    glyph to use when a note has a rest element and a type value
//    of quarter. The c-clef, f-clef, and percussion-clef types
//    specify the glyph to use when a clef sign element value is C,
//    F, or percussion respectively. The g-clef-ottava-bassa type
//    specifies the glyph to use when a clef sign element value is
//    G and the clef-octave-change element value is -1. The
//    octave-shift types specify the glyph to use when an
//    octave-shift type attribute value is up, down, or continue
//    and the octave-shift size attribute value is 8, 15, or 22.
//
//    The SMuFL glyph name should match the type. For instance,
//    a type of quarter-rest would use values restQuarter,
//    restQuarterOld, or restQuarterZ. A type of g-clef-ottava-bassa
//    would use values gClef8vb, gClef8vbOld, or gClef8vbCClef. A
//    type of octave-shift-up-8 would use values ottava, ottavaBassa,
//    ottavaBassaBa, ottavaBassaVb, or octaveBassa.
//
//    The other-appearance element is used to define any
//    graphical settings not yet in the current version of the
//    MusicXML format. This allows extended representation,
//    though without application interoperability.
//-->
//<!ELEMENT appearance
//    (line-width*, note-size*, distance*, glyph*,
//     other-appearance*)>
//<!ELEMENT line-width %layout-tenths;>
//<!ATTLIST line-width
//    type CDATA #REQUIRED
//>
//<!ELEMENT note-size (#PCDATA)>
//<!ATTLIST note-size
//    type (cue | grace | grace-cue | large) #REQUIRED
//>
//<!ELEMENT distance %layout-tenths;>
//<!ATTLIST distance
//    type CDATA #REQUIRED
//>
//<!ELEMENT glyph (#PCDATA)>
//<!ATTLIST glyph
//    type CDATA #REQUIRED
//>
//<!ELEMENT other-appearance (#PCDATA)>
//<!ATTLIST other-appearance
//    type CDATA #REQUIRED
//>

