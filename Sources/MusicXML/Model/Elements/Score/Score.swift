//
//  Score.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//
//  MusicXML score.mod module
//  Version 3.1
//
//  Copyright © 2004-2017 the Contributors to the MusicXML
//  Specification, published by the W3C Music Notation Community
//  Group under the W3C Community Final Specification Agreement
//  (FSA):
//
//     https://www.w3.org/community/about/agreements/final/
//
//  A human-readable summary is available:
//
//     https://www.w3.org/community/about/agreements/fsa-deed/
//

// > The score is the root element for the DTD. It includes
// > the score-header entity, followed either by a series of
// > parts with measures inside (score-partwise) or a series
// > of measures with parts inside (score-timewise). Having
// > distinct top-level elements for partwise and timewise
// > scores makes it easy to ensure that an XSLT stylesheet
// > does not try to transform a document already in the
// > desired format. The document-attributes entity includes the
// > version attribute and is defined in the common.mod file.
//
// <![ %partwise; [
// <!ELEMENT score-partwise (%score-header;, part+)>
// <!ATTLIST score-partwise
//    %document-attributes;
// >
#warning("TODO: Support Score document-attributes")
public struct Score: Equatable {
    let header: Header
    let traversal: Traversal
}

// <!ELEMENT work (work-number?, work-title?, opus?)>
// <!ELEMENT work-number (#PCDATA)>
// <!ELEMENT work-title (#PCDATA)>
public struct Work: Equatable {
    let number: String?
    let title: String?
    let opus: Opus?
}

// <!ELEMENT opus EMPTY>
// <!ATTLIST opus
//    %link-attributes;
// >
#warning("TODO: Implement Opus")
public struct Opus: Decodable, Equatable {
    //let linkAttributes: LinkAttributes
}

// > Collect score-wide defaults. This includes scaling
// > and layout, defined in layout.mod, and default values
// > for the music font, word font, lyric font, and
// > lyric language. The number and name attributes in
// > lyric-font and lyric-language elements are typically
// > used when lyrics are provided in multiple languages.
// > If the number and name attributes are omitted, the
// > lyric-font and lyric-language values apply to all
// > numbers and names.
//
// <!ELEMENT defaults (scaling?, page-layout?,
//    system-layout?, staff-layout*, appearance?,
//    music-font?, word-font?, lyric-font*, lyric-language*)>
public struct Defaults: Decodable, Equatable {
    let scaling: Scaling?
    let pageLayout: PageLayout?
    let systemLayout: Int? // TODO: SystemLayout
    let appearance: Int? // TODO: Appearance
    let musicFont: Font?
    let wordFont: Font?
    let lyricFonts: [LyricFont]?
    let lyricLanguages: [LyricLanguage]?
}

// <!ELEMENT music-font EMPTY>
// <!ATTLIST music-font
//    %font;
// >
// <!ELEMENT word-font EMPTY>
// <!ATTLIST word-font
//    %font;
// >

// <!ELEMENT lyric-font EMPTY>
// <!ATTLIST lyric-font
//    number NMTOKEN #IMPLIED
//    name CDATA #IMPLIED
//    %font;
// >
public struct LyricFont: Decodable, Equatable {
    let number: Int?
    let name: String?
    let font: Font
}

// <!ELEMENT lyric-language EMPTY>
// <!ATTLIST lyric-language
//    number NMTOKEN #IMPLIED
//    name CDATA #IMPLIED
//    xml:lang NMTOKEN #REQUIRED
// >
//
public struct LyricLanguage: Decodable, Equatable {
    let number: Int?
    let name: String?
    let language: String
}

// MARK: - Decoding

extension Score: Decodable {

    // MARK: - Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.header  = try container.decode(Header.self)
        self.traversal = try container.decode(Traversal.self)
    }
}



extension Work: Decodable { }

// MARK: - TODO

//<!--
//    The part-group element indicates groupings of parts in the
//    score, usually indicated by braces and brackets. Braces
//    that are used for multi-staff parts should be defined in
//    the attributes element for that part. The part-group start
//    element appears before the first score-part in the group.
//    The part-group stop element appears after the last
//    score-part in the group.
//
//    The number attribute is used to distinguish overlapping
//    and nested part-groups, not the sequence of groups. As
//    with parts, groups can have a name and abbreviation.
//    Formatting attributes for group-name and group-abbreviation
//    are deprecated in Version 2.0 in favor of the new
//    group-name-display and group-abbreviation-display elements.
//    Formatting specified in the group-name-display and
//    group-abbreviation-display elements overrides formatting
//    specified in the group-name and group-abbreviation
//    elements, respectively.
//    The group-symbol element indicates how the symbol for
//    a group is indicated in the score. Values include none,
//    brace, line, bracket, and square; the default is none.
//    The group-barline element indicates if the group should
//    have common barlines. Values can be yes, no, or
//    Mensurstrich. The group-time element indicates that the
//    displayed time signatures should stretch across all parts
//    and staves in the group. Values for the child elements
//    are ignored at the stop of a group.
//    A part-group element is not needed for a single multi-staff
//    part. By default, multi-staff parts include a brace symbol
//    and (if appropriate given the bar-style) common barlines.
//    The symbol formatting for a multi-staff part can be more
//    fully specified using the part-symbol element, defined in
//    the attributes.mod file.
//-->
//<!ELEMENT part-group (group-name?, group-name-display?,
//    group-abbreviation?, group-abbreviation-display?,
//    group-symbol?, group-barline?, group-time?, %editorial;)>
//<!ATTLIST part-group
//    type %start-stop; #REQUIRED
//    number CDATA "1"
//>
//
//<!ELEMENT group-name (#PCDATA)>
//<!ATTLIST group-name
//    %print-style;
//    %justify;
//>
//<!ELEMENT group-name-display
//    ((display-text | accidental-text)*)>
//<!ATTLIST group-name-display
//    %print-object;
//>
//<!ELEMENT group-abbreviation (#PCDATA)>
//<!ATTLIST group-abbreviation
//    %print-style;
//    %justify;
//>
//<!ELEMENT group-abbreviation-display
//    ((display-text | accidental-text)*)>
//<!ATTLIST group-abbreviation-display
//    %print-object;
//>
//
//<!ELEMENT group-symbol (#PCDATA)>
//<!ATTLIST group-symbol
//    %position;
//    %color;
//>
//
//<!ELEMENT group-barline (#PCDATA)>
//<!ATTLIST group-barline
//    %color;
//>
//<!ELEMENT group-time EMPTY>
//
//<!--
//    The score-instrument element allows for multiple
//    instruments per score-part. As with the score-part
//    element, each score-instrument has a required ID
//    attribute, a name, and an optional abbreviation. The
//    instrument-name and instrument-abbreviation are
//    typically used within a software application, rather
//    than appearing on the printed page of a score.
//    A score-instrument element is also required if the
//    score specifies MIDI 1.0 channels, banks, or programs.
//    An initial midi-instrument assignment can also
//    be made here.
//    The instrument-sound and virtual-instrument elements
//    are new as of Version 3.0. The instrument-sound element
//    describes the default timbre of the score-instrument. This
//    description is independent of a particular virtual or
//    MIDI instrument specification and allows playback to be
//    shared more easily between applications and libraries.
//    The virtual-instrument element defines a specific virtual
//    instrument used for an instrument sound. The
//    virtual-library element indicates the virtual instrument
//    library name, and the virtual-name element indicates the
//    library-specific name for the virtual instrument.
//    The solo and ensemble elements are new as of Version
//    2.0. The solo element is present if performance is
//    intended by a solo instrument. The ensemble element
//    is present if performance is intended by an ensemble
//    such as an orchestral section. The text of the
//    ensemble element contains the size of the section,
//    or is empty if the ensemble size is not specified.
//
//    The midi-instrument element is defined in the common.mod
//    file, as it can be used within both the score-part and
//    sound elements.
//-->
//<!ELEMENT score-instrument
//    (instrument-name, instrument-abbreviation?,
//     instrument-sound?, (solo | ensemble)?,
//     virtual-instrument?)>
//<!ATTLIST score-instrument
//    id ID #REQUIRED
//>
//<!ELEMENT instrument-name (#PCDATA)>
//<!ELEMENT instrument-abbreviation (#PCDATA)>
//<!ELEMENT instrument-sound (#PCDATA)>
//<!ELEMENT solo EMPTY>
//<!ELEMENT ensemble (#PCDATA)>
//<!ELEMENT virtual-instrument
//    (virtual-library?, virtual-name?)>
//<!ELEMENT virtual-library (#PCDATA)>
//<!ELEMENT virtual-name (#PCDATA)>
//
//<!--
//    The group element allows the use of different versions of
//    the part for different purposes. Typical values include
//    score, parts, sound, and data. Ordering information that is
//    directly encoded in MuseData can be derived from the
//    ordering within a MusicXML score or opus.
//-->
//<!ELEMENT group (#PCDATA)>
//

