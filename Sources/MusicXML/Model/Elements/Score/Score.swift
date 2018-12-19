import XMLCoder

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
//  Works and movements are optionally identified by number
//  and title. The work element also may indicate a link
//  to the opus document that composes multiple movements
//  into a collection.
extension MusicXML {

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
    #warning("TODO: Document attributes")
    public struct Score: Decodable, Equatable {

        enum Traversal: Decodable, Equatable {

            enum CodingKeys: String, CodingKey {
                case partwise = "score-partwise"
                case timewise = "score-timewise"
            }

            case partwise(Partwise)
            case timewise(Timewise)

            init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                do {
                    self = .partwise(try container.decode(Partwise.self))
                } catch {
                    self = .timewise(try container.decode(Timewise.self))
                }
            }
        }

        let header: Header
        let traversal: Traversal

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            self.header  = try container.decode(Header.self)
            self.traversal = try container.decode(Traversal.self)
        }
    }

    public struct MusicData: Decodable, Equatable {

        let values: [MusicDatum]

        public init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            self.values = try container.decode([MusicDatum].self)
        }
    }

    #warning("TODO: Build out MusicDatum")
    public enum MusicDatum: Decodable, Equatable {

        enum CodingKeys: String, CodingKey {
            case note
        }

        case note(Note)
        case other

        public init(from decoder: Decoder) throws {
            var container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self = .note(try container.decode(Note.self, forKey: .note))
            } catch {
                self = .other
            }
        }
    }

//<!--
//    Collect score-wide defaults. This includes scaling
//    and layout, defined in layout.mod, and default values
//    for the music font, word font, lyric font, and
//    lyric language. The number and name attributes in
//    lyric-font and lyric-language elements are typically
//    used when lyrics are provided in multiple languages.
//    If the number and name attributes are omitted, the
//    lyric-font and lyric-language values apply to all
//    numbers and names.
//-->
//<!ELEMENT defaults (scaling?, page-layout?,
//    system-layout?, staff-layout*, appearance?,
//    music-font?, word-font?, lyric-font*, lyric-language*)>
//
//<!ELEMENT music-font EMPTY>
//<!ATTLIST music-font
//    %font;
//>
//<!ELEMENT word-font EMPTY>
//<!ATTLIST word-font
//    %font;
//>
//<!ELEMENT lyric-font EMPTY>
//<!ATTLIST lyric-font
//    number NMTOKEN #IMPLIED
//    name CDATA #IMPLIED
//    %font;
//>
//<!ELEMENT lyric-language EMPTY>
//<!ATTLIST lyric-language
//    number NMTOKEN #IMPLIED
//    name CDATA #IMPLIED
//    xml:lang NMTOKEN #REQUIRED
//>
//
//<!--
//    Credit elements refer to the title, composer, arranger,
//    lyricist, copyright, dedication, and other text, symbols,
//    and graphics that commonly appear on the first page of a
//    score. The credit-words, credit-symbol, and credit-image
//    elements are similar to the words, symbol, and image
//    elements for directions. However, since the credit is not
//    part of a measure, the default-x and default-y attributes
//    adjust the origin relative to the bottom left-hand corner
//    of the page. The  enclosure for credit-words and
//    credit-symbol is none by default.
//    By default, a series of credit-words and credit-symbol
//    elements within a single credit element follow one another
//    in sequence visually. Non-positional formatting attributes
//    are carried over from the previous element by default.
//    The page attribute for the credit element specifies the page
//    number where the credit should appear. This is an integer
//    value that starts with 1 for the first page. Its value is 1
//    by default. Since credits occur before the music, these page
//    numbers do not refer to the page numbering specified by the
//    print element's page-number attribute.
//    The credit-type element indicates the purpose behind a
//    credit. Multiple types of data may be combined in a single
//    credit, so multiple elements may be used. Standard values
//    include page number, title, subtitle, composer, arranger,
//    lyricist, and rights.
//-->
//<!ELEMENT credit
//    (credit-type*, link*, bookmark*,
//     (credit-image |
//      ((credit-words | credit-symbol),
//       (link*, bookmark*, (credit-words | credit-symbol))*)))>
//<!ATTLIST credit
//    page NMTOKEN #IMPLIED
//    %optional-unique-id;
//>
//
//<!ELEMENT credit-type (#PCDATA)>
//
//<!ELEMENT credit-words (#PCDATA)>
//<!ATTLIST credit-words
//    %text-formatting;
//    %optional-unique-id;
//>
//
//<!--
//    The credit-symbol element specifies a musical symbol
//    using a canonical SMuFL glyph name.
//-->
//<!ELEMENT credit-symbol (#PCDATA)>
//<!ATTLIST credit-symbol
//    %symbol-formatting;
//    %optional-unique-id;
//>
//
//<!ELEMENT credit-image EMPTY>
//<!ATTLIST credit-image
//    source CDATA #REQUIRED
//    type CDATA #REQUIRED
//    height %tenths; #IMPLIED
//    width %tenths; #IMPLIED
//    %position;
//    %halign;
//    %valign-image;
//    %optional-unique-id;
//>
//

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

//<!ELEMENT part (measure+)>
//<!ELEMENT measure (%music-data;)>
//]]>
//<![ %timewise; [
//<!ELEMENT score-timewise (%score-header;, measure+)>
//<!ATTLIST score-timewise
//    %document-attributes;
//>
//<!ELEMENT measure (part+)>
//<!ELEMENT part (%music-data;)>
//]]>

}
