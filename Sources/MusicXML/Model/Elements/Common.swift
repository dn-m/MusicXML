//
//  Common.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//
//  MusicXML common.mod module
//  Version 3.1
//
//  Copyright © 2004-2017 the Contributors to the MusicXML
//  Specification, published by the W3C Music Notation Community
//  Group under the W3C Community Final Specification Agreement
//  (FSA):
//
//      https://www.w3.org/community/about/agreements/final/
//
//  A human-readable summary is available:
//
//     https://www.w3.org/community/about/agreements/fsa-deed/
//
//    This file contains entities and elements that are common
//    across multiple DTD modules. In particular, several elements
//    here are common across both notes and measures.

#warning("Build out ASCII compatibility")
//    If greater ASCII compatibility is desired, entity references
//    may be used instead of the direct Unicode characters.
//    Currently we include ISO Latin-1 for Western European
//    characters and ISO Latin-2 for Central European characters.
//    These files are local copies of the W3C entities located at:
//        http://www.w3.org/2003/entities/
//-->
//<!ENTITY % isolat1 PUBLIC
//    "ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
//    "isolat1.ent">
//%isolat1;
//<!ENTITY % isolat2 PUBLIC
//    "ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
//    "isolat2.ent">
//%isolat2;
//
//<!--
//    Data type entities. The ones that resolve to strings show
//    intent for how data is formatted and used.
//-->
//
//<!--
//    Calendar dates are represented yyyy-mm-dd format, following
//    ISO 8601.
//-->
//<!ENTITY % yyyy-mm-dd "(#PCDATA)">
//
//<!--
//    The tenths entity is a number representing tenths of
//    interline space (positive or negative) for use in
//    attributes. The layout-tenths entity is the same for
//    use in elements. Both integer and decimal values are
//    allowed, such as 5 for a half space and 2.5 for a
//    quarter space. Interline space is measured from the
//    middle of a staff line.
//-->
//<!ENTITY % tenths "CDATA">
//<!ENTITY % layout-tenths "(#PCDATA)">

// > The start-stop and start-stop-continue entities are used
// > for musical elements that can either start or stop, such
// > as slurs, tuplets, and wedges. The start-stop-continue
// > entity is used when there is a need to refer to an
// > intermediate point in the symbol, as for complex slurs
// > or for specifying formatting of symbols across system
// > breaks.
// > The start-stop-single entity is used when the same element
// > is used for multi-note and single-note notations, as for
// > groupings. The tremolo-type entity is used to distinguish
// > multi-note, single-note, and unmeasured tremolos.
// > The values of start, stop, and continue refer to how an
// > element appears in musical score order, not in MusicXML
// > document order. An element with a stop attribute may
// > precede the corresponding element with a start attribute
// > within a MusicXML document. This is particularly common
// > in multi-staff music. For example, the stopping point for
// > a slur may appear in staff 1 before the starting point for
// > the slur appears in staff 2 later in the document.
// > The tied-type entity is used as an attribute of the tied
// > element to specify where the visual representation of a
// > tie begins and ends. A tied element which joins two notes
// > can be specified with tied-type start on the first note and
// > tied-type stop on the second note. To indicate a note
// > should be undamped, use a single tied element with
// > tied-type let-ring. For other ties that are visually
// > attached to a single note, such as a tie leading into or
// > out of a repeated section or coda, use two tied elements on
// > the same note, one start and one stop.
// > In start-stop cases, ties can add more elements using a
// > continue type. This is typically used to specify the
// > formatting of cross-system ties.
//
// <!ENTITY % start-stop "(start | stop)">
// <!ENTITY % start-stop-continue "(start | stop | continue)">
// <!ENTITY % start-stop-single "(start | stop | single)">
// <!ENTITY % tied-type "(start | stop | continue | let-ring)">
// <!ENTITY % tremolo-type "(start | stop | single | unmeasured)">



public enum TiedType: String, Decodable {
    case start = "start"
    case stop = "stop"
    case letRight = "let-ring"
}

public enum TremoloType: String, Decodable {
    case start
    case stop
    case single
    case unmeasured
}

// > The number-of-lines entity is used to specify the
// > number of lines in text decoration attributes.
//
// <!ENTITY % number-of-lines "(0 | 1 | 2 | 3)">
public enum NumberOfLines: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
}

// > Slurs, tuplets, and many other features can be
// > concurrent and overlapping within a single musical
// > part. The number-level attribute distinguishes up to
// > six concurrent objects of the same type. A reading
// > program should be prepared to handle cases where
// > the number-levels stop in an arbitrary order.
// > Different numbers are needed when the features
// > overlap in MusicXML document order. When a number-level
// > value is implied, the value is 1 by default.
//
// <!ENTITY % number-level "(1 | 2 | 3 | 4 | 5 | 6)">
public enum NumberLevel: String, Decodable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
}

// > The smufl-glyph-name entity is used for attributes that
// > reference a specific Standard Music Font Layout (SMuFL)
// > character. The value is a SMuFL canonical glyph name,
// > not a code point. For instance, the value for a standard
// > piano pedal mark would be keyboardPedalPed, not U+E650.
//
// <!ENTITY % smufl-glyph-name "NMTOKEN">
public struct SMuFLGlyph: Decodable, Equatable {
    let name: String
}

// MARK - Formatting



// > The placement attribute indicates whether something is
// > above or below another element, such as a note or a
// > notation.
//
//<!ENTITY % placement
//    "placement %above-below; #IMPLIED">
//
public enum Placement: String, Decodable {
    case above
    case below
}

// > The orientation attribute indicates whether slurs and
// > ties are overhand (tips down) or underhand (tips up).
// > This is distinct from the placement entity used by any
// > notation type.
//
//<!ENTITY % orientation
//    "orientation (over | under) #IMPLIED">
public enum Orientation: String, Decodable {
    case over
    case under
}

// > The bezier entity is used to indicate the curvature of
// > slurs and ties, representing the control points for a
// > cubic bezier curve. For ties, the bezier entity is
// > used with the tied element.
// > Normal slurs, S-shaped slurs, and ties need only two
// > bezier points: one associated with the start of the slur
// > or tie, the other with the stop. Complex slurs and slurs
// > divided over system breaks can specify additional
// > bezier data at slur elements with a continue type.
//
// > The bezier-x, bezier-y, and bezier-offset attributes
// > describe the outgoing bezier point for slurs and ties
// > with a start type, and the incoming bezier point for
// > slurs and ties with types of stop or continue. The
// > bezier-x2, bezier-y2, and bezier-offset2 attributes
// > are only valid with slurs of type continue, and
// > describe the outgoing bezier point.
//
// > The bezier-x, bezier-y, bezier-x2, and bezier-y2
// > attributes are specified in tenths, relative to any
// > position settings associated with the slur or tied
// > element. The bezier-offset and bezier-offset2
// > attributes are measured in terms of musical divisions,
// > like the offset element.
// > The bezier-offset and bezier-offset2 attributes are
// > deprecated as of MusicXML 3.1. If both the bezier-x
// > and bezier-offset attributes are present, the bezier-x
// > attribute takes priority. Similarly, the bezier-x2
// > attribute takes priority over the bezier-offset2
// > attribute. The two types of bezier attributes are
// > not additive.
//
// <!ENTITY % bezier
//    "bezier-x       %tenths;  #IMPLIED
//     bezier-y       %tenths;  #IMPLIED
//     bezier-x2      %tenths;  #IMPLIED
//     bezier-y2      %tenths;  #IMPLIED
//     bezier-offset  CDATA     #IMPLIED
//     bezier-offset2 CDATA     #IMPLIED">
public struct Bezier {
    let x: Int
    let y: Int
    let x2: Int
    let y2: Int
    let offset: Int
    let offset2: Int
}



// > The text-decoration entity is based on the similar
// > feature in XHTML and CSS. It allows for text to
// > be underlined, overlined, or struck-through. It
// > extends the CSS version by allow double or
// > triple lines instead of just being on or off.
//
// <!ENTITY % text-decoration
//    "underline  %number-of-lines;  #IMPLIED
//     overline  %number-of-lines;   #IMPLIED
//     line-through  %number-of-lines;   #IMPLIED">
public struct TextDecoration: Decodable, Equatable {
    let underline: Int = 0
    let overline: Int = 0
    let lineThrough: Int = 0
}

// > The justify entity is used to indicate left, center, or
// > right justification. The default value varies for different
// > elements. For elements where the justify attribute is present
// > but the halign attribute is not, the justify attribute
// > indicates horizontal alignment as well as justification.
//
// <!ENTITY % justify
//    "justify (left | center | right) #IMPLIED">
public enum Justify: String, Decodable {
    case left
    case center
    case right
}

// > In cases where text extends over more than one line,
// > horizontal alignment and justify values can be different.
// > The most typical case is for credits, such as:
// >     Words and music by
// >       Pat Songwriter
// > Typically this type of credit is aligned to the right,
// > so that the position information refers to the right-
// > most part of the text. But in this example, the text
// > is center-justified, not right-justified.
// > The halign attribute is used in these situations. If it
// > is not present, its value is the same as for the justify
// > attribute.
//
// <!ENTITY % halign
//    "halign (left | center | right) #IMPLIED">
public enum HorizonalAlignment: String, Decodable, Equatable {
    case left
    case center
    case right
}


// > The valign-image entity is used to indicate vertical
// > alignment for images and graphics, so it removes the
// > baseline value. Defaults are implementation-dependent.
//
// <!ENTITY % valign-image
//    "valign (top | middle | bottom) #IMPLIED">
public enum VerticalImageAlignment: String, Decodable, Equatable {
    case top
    case middle
    case bottom
}

// > The letter-spacing entity specifies text tracking.
// > Values are either "normal" or a number representing
// > the number of ems to add between each letter. The
// > number may be negative in order to subtract space.
// > The default is normal, which allows flexibility of
// > letter-spacing for purposes of text justification.
//
// <!ENTITY % letter-spacing
//    "letter-spacing CDATA #IMPLIED">
public enum LetterSpacing: Decodable, Equatable {

    case normal
    case adjusted(Int)

    enum CodingKeys: String, CodingKey {
        case normal
        case adjusted
    }

    public init(from decoder: Decoder) throws {
        let keyed = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .adjusted(try keyed.decode(Int.self, forKey: .adjusted))
        } catch {
            self = .normal
        }
    }
}

// > The line-height entity specified text leading. Values
// > are either "normal" or a number representing the
// > percentage of the current font height  to use for
// > leading. The default is "normal". The exact normal
// > value is implementation-dependent, but values
// > between 100 and 120 are recommended.
//
// <!ENTITY % line-height
//    "line-height CDATA #IMPLIED">
public enum LineHeight: Decodable, Equatable {
    case normal
    case adjusted(Int)
    enum CodingKeys: String, CodingKey {
        case normal
        case adjusted
    }
    public init(from decoder: Decoder) throws {
        let keyed = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .adjusted(try keyed.decode(Int.self, forKey: .adjusted))
        } catch {
            self = .normal
        }
    }
}

// > The text-rotation entity is used to rotate text
// > around the alignment point specified by the
// > halign and valign entities. The value is a number
// > ranging from -180 to 180. Positive values are
// > clockwise rotations, while negative values are
// > counter-clockwise rotations.
//
// <!ENTITY % text-rotation
//    "rotation CDATA #IMPLIED">
public struct TextRotation: Decodable, Equatable {
    let degrees: Double
}

// > The enclosure entity is used to specify the
// > formatting of an enclosure around text or symbols.
//
// <!ENTITY % enclosure
//    "enclosure %enclosure-shape; #IMPLIED">
public struct Enclosure: Decodable, Equatable {
    let shape: EnclosureShape
}





// <!ENTITY % line-length
//    "line-length (short | medium | long) #IMPLIED">
public enum LineLength {
    case short
    case medium
    case long
}

// > The text-formatting entity contains the common formatting
// > attributes for text elements. Default values may differ
// > across the elements that use this entity.
//
// <!ENTITY % text-formatting
//    "%justify;
//     %print-style-align;
//     %text-decoration;
//     %text-rotation;
//     %letter-spacing;
//     %line-height;
//     xml:lang NMTOKEN #IMPLIED
//     xml:space (default | preserve) #IMPLIED
//     %text-direction;
//     %enclosure;">
public struct TextFormatting: Decodable, Equatable {
    let justify: Justify
}

// > The symbol-formatting entity contains the common formatting
// > attributes for musical symbols. Default values may differ
// > across the elements that use this entity.
//
// <!ENTITY % symbol-formatting
//    "%justify;
//     %print-style-align;
//     %text-decoration;
//     %text-rotation;
//     %letter-spacing;
//     %line-height;
//     %text-direction;
//     %enclosure;">
public struct SymbolFormatting: Decodable, Equatable {
    let justify: Justify
    let printStyleAlignment: PrintStyleAlign
    let decoration: TextDecoration
    let rotation: TextRotation
    let letterSpacing: LetterSpacing
    let lineHeight: LineHeight
    let textDirection: TextDirection
    let enclosure: Enclosure
}



// MARK: - Plyaback Attributes

// > The bend-sound entity is used for bend and slide elements,
// > and is similar to the trill-sound. Here the beats element
// > refers to the number of discrete elements (like MIDI pitch
// > bends) used to represent a continuous bend or slide. The
// > first-beat indicates the percentage of the direction for
// > starting a bend; the last-beat the percentage for ending it.
// > The default choices are:
//
// >     accelerate = "no"
// >     beats = "4" (minimum of "2")
// >     first-beat = "25"
// >     last-beat = "75"
//
// <!ENTITY % bend-sound
//    "accelerate    %yes-no; #IMPLIED
//     beats         CDATA    #IMPLIED
//     first-beat    CDATA    #IMPLIED
//     last-beat     CDATA    #IMPLIED">
public struct BendSound {
    let accelerate: Bool = false
    let beats: Int = 4
    let firstBeat: Int = 25
    let lastBeat: Int = 75
}

// > The time-only entity is used to indicate that a particular
// > playback-related element only applies particular times through
// > a repeated section.
//
// <!ENTITY % time-only
//    "time-only CDATA #IMPLIED">
public struct TimeOnly {
    // > The value is a comma-separated list of
    // > positive integers arranged in ascending order, indicating which
    // > times through the repeated section that the element applies.
    let offsets: [Int]
}

// MARK: - Other

// > The document-attributes entity is used to specify the
// > attributes for an entire MusicXML document. Currently
// > this is used for the version attribute.
// > The version attribute was added in Version 1.1 for the
// > score-partwise and score-timewise documents, and in
// > Version 2.0 for opus documents. It provides an easier
// > way to get version information than through the MusicXML
// > public ID. The default value is 1.0 to make it possible
// > for programs that handle later versions to distinguish
// > earlier version files reliably. Programs that write
// > MusicXML 1.1 or later files should set this attribute.
//
// <!ENTITY % document-attributes
//    "version  CDATA  '1.0'">
public struct DocumentAttributes: Decodable {
    let version: String
}

#warning("TODO: optional-unique-id")
//    The optional-unique-id entity allows an element to optionally
//    specify an ID that is unique to the entire document. This
//    entity is not used for a required id attribute, or for an id
//    attribute that specifies an id reference.
//
// <!ENTITY % optional-unique-id
//    "id ID #IMPLIED">

// > The smufl entity is used to indicate a particular Standard
// > Music Font Layout (SMuFL) character. Sometimes this is a
// > formatting choice, and sometimes this is a refinement of
// > the semantic meaning of an element.
//
// <!ENTITY % smufl
//    "smufl %smufl-glyph-name; #IMPLIED">
public struct SMuFL: Decodable, Equatable {
    // TODO: Consider nesting Glyph in here.
    let glyph: SMuFLGlyph
}

// MARK: - Elements




// > Footnote and level are used to specify editorial
// > information, while voice is used to distinguish between
// > multiple voices (what MuseData calls tracks) in individual
// > parts. These elements are used throughout the different
// > MusicXML DTD modules. If the reference attribute for the
// > level element is yes, this indicates editorial information
// > that is for display only and should not affect playback.
// > For instance, a modern edition of older music may set
// > reference="yes" on the attributes containing the music's
// > original clef, key, and time signature. It is no by default.
//
// <!ELEMENT footnote (#PCDATA)>
// <!ATTLIST footnote
//    %text-formatting;
// >
public struct Footnote: Decodable, Equatable {
    let text: String
    let formatting: TextFormatting
}



// <!ELEMENT voice (#PCDATA)>
public struct Voice: Decodable, Equatable {
    let value: Int
}




// > Staff assignment is only needed for music notated on
// > multiple staves. Used by both notes and directions. Staff
// > values are numbers, with 1 referring to the top-most staff
// > in a part.
//
// <!ELEMENT staff (#PCDATA)>
public struct Staff: Decodable, Equatable {
    let value: Int
}

// > Segno and coda signs can be associated with a measure
// > or a general musical direction. These are visual
// > indicators only; a sound element is also needed to guide
// > playback applications reliably. The exact glyph can be
// > specified with the smufl attribute using a SMuFL canonical
// > glyph name that starts with segno or coda respectively.
//
// <!ELEMENT segno EMPTY>
// <!ATTLIST segno
//    %print-style-align;
//    %optional-unique-id;
//    %smufl;
// >
public struct Segno: Decodable, Equatable {
    let printStyleAlignment: PrintStyleAlign
    let smufl: SMuFL
    let id: Int?
}

// <!ELEMENT coda EMPTY>
// <!ATTLIST coda
//    %print-style-align;
//    %optional-unique-id;
//    %smufl;
//>
public struct Coda: Decodable, Equatable {
    let printStyleAlignment: PrintStyleAlign
    let smufl: SMuFL
    let id: Int?
}

#warning("TODO: actual-notes, normal-notes, normal-type, normal-dot")
// > These elements are used both in the time-modification and
// > metronome-tuplet elements. The actual-notes element
// > describes how many notes are played in the time usually
// > occupied by the number of normal-notes. If the normal-notes
// > type is different than the current note type (e.g., a
// > quarter note within an eighth note triplet), then the
// > normal-notes type (e.g. eighth) is specified in the
// > normal-type and normal-dot elements. The content of the
// > actual-notes and normal-notes elements is a non-negative
// > integer.
//
// <!ELEMENT actual-notes (#PCDATA)>
// <!ELEMENT normal-notes (#PCDATA)>
// <!ELEMENT normal-type (#PCDATA)>
// <!ELEMENT normal-dot EMPTY>


// > Dynamics can be associated either with a note or a general
// > musical direction. To avoid inconsistencies between and
// > amongst the letter abbreviations for dynamics (what is sf
// > vs. sfz, standing alone or with a trailing dynamic that is
// > not always piano), we use the actual letters as the names
// > of these dynamic elements. The other-dynamics element
// > allows other dynamic marks that are not covered here, but
// > many of those should perhaps be included in a more general
// > musical direction element. Dynamics may also be combined as
// > in <sf/><mp/>.
//
// > These letter dynamic symbols are separated from crescendo,
// > decrescendo, and wedge indications. Dynamic representation
// > is inconsistent in scores. Many things are assumed by the
// > composer and left out, such as returns to original dynamics.
// > Systematic representations are quite complex: for example,
// > Humdrum has at least 3 representation formats related to
// > dynamics. The MusicXML format captures what is in the score,
// > but does not try to be optimal for analysis or synthesis of
// > dynamics.
//
// <!ELEMENT dynamics ((p | pp | ppp | pppp | ppppp | pppppp |
//    f | ff | fff | ffff | fffff | ffffff | mp | mf | sf |
//    sfp | sfpp | fp | rf | rfz | sfz | sffz | fz |
//    n | pf | sfzp | other-dynamics)*)>
// <!ATTLIST dynamics
//    %print-style-align;
//    %placement;
//    %text-decoration;
//    %enclosure;
//    %optional-unique-id;
//>
public struct Dynamics {

    // <!ELEMENT other-dynamics (#PCDATA)>
    // <!ATTLIST other-dynamics
    //    %smufl;
    // >
    public struct Other: Equatable, Decodable {
        let smufl: SMuFL
    }

    // <!ELEMENT p EMPTY>
    // <!ELEMENT pp EMPTY>
    // <!ELEMENT ppp EMPTY>
    // <!ELEMENT pppp EMPTY>
    // <!ELEMENT ppppp EMPTY>
    // <!ELEMENT pppppp EMPTY>
    // <!ELEMENT f EMPTY>
    // <!ELEMENT ff EMPTY>
    // <!ELEMENT fff EMPTY>
    // <!ELEMENT ffff EMPTY>
    // <!ELEMENT fffff EMPTY>
    // <!ELEMENT ffffff EMPTY>
    // <!ELEMENT mp EMPTY>
    // <!ELEMENT mf EMPTY>
    // <!ELEMENT sf EMPTY>
    // <!ELEMENT sfp EMPTY>
    // <!ELEMENT sfpp EMPTY>
    // <!ELEMENT fp EMPTY>
    // <!ELEMENT rf EMPTY>
    // <!ELEMENT rfz EMPTY>
    // <!ELEMENT sfz EMPTY>
    // <!ELEMENT sffz EMPTY>
    // <!ELEMENT fz EMPTY>
    // <!ELEMENT n EMPTY>
    // <!ELEMENT pf EMPTY>
    // <!ELEMENT sfzp EMPTY>
    public enum Dynamic: Equatable, Decodable {
        public init(from decoder: Decoder) throws {
            fatalError()
        }

        case p
        case pp
        case ppp
        case pppp
        case ppppp
        case pppppp
        case f
        case ff
        case fff
        case ffff
        case fffff
        case ffffff
        case mp
        case mf
        case sf
        case sfp
        case sfpp
        case fp
        case rf
        case rfz
        case sfz
        case sffz
        case fz
        case n
        case pf
        case sfzp
        case other(Other)
    }

    let values: [Dynamic]
}

extension Dynamics: Equatable, Decodable {
    public init(from decoder: Decoder) throws {
        fatalError()
    }
}

// MARK: - Frets, String, and Fingering


// > Fret and string are used with tablature notation and chord
// > symbols. Fret numbers start with 0 for an open string and
// > 1 for the first fret. String numbers start with 1 for the
// > highest pitched full-length string. The string element can
// > also be used in regular notation.
//
// <!ELEMENT fret (#PCDATA)>
// <!ATTLIST fret
//    %font;
//    %color;
// >
public struct TablatureFret {
    let font: Font
    let color: Color
}

// <!ELEMENT string (#PCDATA)>
// <!ATTLIST string
//    %print-style;
//    %placement;
// >
// NOTE: `String` cannot be used here as it conflicts with the stdlib type.
public struct TablatureString {
    let printStyle: PrintStyle
    let placement: Placement
}

#warning("TODO: tuning-step, tuning-alter, tuning-octave")
//    The tuning-step, tuning-alter, and tuning-octave elements
//    are represented like the step, alter, and octave elements,
//    with different names to reflect their different function.
//    They are used in the staff-tuning and accord elements.
//
// <!ELEMENT tuning-step (#PCDATA)>
// <!ELEMENT tuning-alter (#PCDATA)>
// <!ELEMENT tuning-octave (#PCDATA)>

// > The display-text element is used for exact formatting of
// > multi-font text in element in display elements such as
// > part-name-display. Language is Italian ("it") by default.
// > Enclosure is none by default.
//
// <!ELEMENT display-text (#PCDATA)>
// <!ATTLIST display-text
//    %text-formatting;
// >
public struct DisplayText: Decodable, Equatable {
    let value: String
    let formatting: TextFormatting
}

public enum DisplayTextOrAccidentalText: Decodable, Equatable {

    enum CodingKeys: String, CodingKey {
        case displayText
        case accidentalText
    }

    case displayText(DisplayText)
    case accidentalText(AccidentalText)

    public init(from decoder: Decoder) throws {
        let keyed = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .displayText(try keyed.decode(DisplayText.self, forKey: .displayText))
        } catch {
            self = .accidentalText(try keyed.decode(AccidentalText.self, forKey: .accidentalText))
        }
    }
}

// > The part-name-display and part-abbreviation-display
// > elements are used in both the score.mod and direction.mod
// > files. They allow more precise control of how part names
// > and abbreviations appear throughout a score. The
// > print-object attributes can be used to determine what,
// > if anything, is printed at the start of each system.
// > Formatting specified in the part-name-display and
// > part-abbreviation-display elements override the formatting
// > specified in the part-name and part-abbreviation elements,
// > respectively.
//
// <!ELEMENT part-name-display
//    ((display-text | accidental-text)*)>
// <!ATTLIST part-name-display
//    %print-object;
// >
public struct PartNameDisplay: Decodable, Equatable {
    let metadata: [DisplayTextOrAccidentalText]
    let printObject: Bool
}

// <!ELEMENT part-abbreviation-display
//    ((display-text | accidental-text)*)>
// <!ATTLIST part-abbreviation-display
//    %print-object;
// >
public struct PartAbbreviationDisplay: Decodable, Equatable {
    let metadata: [DisplayTextOrAccidentalText]
    let printObject: Bool
}



// > The play element, new in Version 3.0, specifies playback
// > techniques to be used in conjunction with the instrument-sound
// > element. When used as part of a sound element, it applies to
// > all notes going forward in score order. In multi-instrument
// > parts, the affected instrument should be specified using the
// > id attribute. When used as part of a note element, it applies
// > to the current note only.
//
// <!ELEMENT play ((ipa | mute | semi-pitched | other-play)*)>
// <!ATTLIST play
//    id IDREF #IMPLIED
// >
public struct Play {

    public enum Kind {

        // > The other-play element represents other types of playback. The
        // > required type attribute indicates the type of playback to which
        // > the element content applies.
        //
        // <!ELEMENT other-play (#PCDATA)>
        // <!ATTLIST other-play
        //    type CDATA #REQUIRED
        // >
        public struct Other {
            let type: String
        }

        // > The semi-pitched element represents categories of indefinite
        // > pitch for percussion instruments. Values are high, medium-high,
        // > medium, medium-low, low, and very-low.
        //
        // <!ELEMENT semi-pitched (#PCDATA)>
        public enum SemiPitched: String {
            case high
            case mediumHigh = "medium-height"
            case medium
            case mediumLow = "medium-low"
            case low
            case veryLow = "very-low"
        }

        // > The ipa element represents International Phonetic Alphabet
        // > (IPA) sounds for vocal music. String content is limited to
        // > IPA 2005 symbols represented in Unicode 6.0.
        //
        // <!ELEMENT ipa (#PCDATA)>
        case ipa(String)
        case mute(Mute)
        case semiPitched(SemiPitched)
    }

    let id: Int?
}
