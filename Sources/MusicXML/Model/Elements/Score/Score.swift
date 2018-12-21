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
