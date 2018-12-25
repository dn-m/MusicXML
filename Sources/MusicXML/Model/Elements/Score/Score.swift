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
#warning("TODO: Implement Opus (LinkAttributes)")
public struct Opus: Decodable, Equatable {
//    let linkAttributes: LinkAttributes
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

    // <!ELEMENT music-font EMPTY>
    // <!ATTLIST music-font
    //    %font;
    // >
    let musicFont: Font?

    // <!ELEMENT word-font EMPTY>
    // <!ATTLIST word-font
    //    %font;
    // >
    let wordFont: Font?
    let lyricFonts: [LyricFont]?
    let lyricLanguages: [LyricLanguage]?
}

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
