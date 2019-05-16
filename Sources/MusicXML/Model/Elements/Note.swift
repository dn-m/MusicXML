//
//  Note.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//
//
//  MusicXML note.mod module
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

//  The note DTD module contains the note representations for
//  the MusicXML format. It contains the note element, all its
//  children elements, and related entities.

import XMLCoder

// Notes are the most common type of MusicXML data. The
// MusicXML format keeps the MuseData distinction between
// elements used for sound information and elements used for
// notation information (e.g., tie is used for sound, tied for
// notation). Thus grace notes do not have a duration element.
// Cue notes have a duration element, as do forward elements,
// but no tie elements. Having these two types of information
// available can make interchange considerably easier, as
// some programs handle one type of information much more
// readily than the other.
//
//<!ELEMENT note
// (((grace, ((%full-note;, (tie, tie?)?) | (cue, %full-note;))) |
//   (cue, %full-note;, duration) |
//   (%full-note;, duration, (tie, tie?)?)),
//  instrument?, %editorial-voice;, type?, dot*,
//  accidental?, time-modification?, stem?, notehead?,
//  notehead-text?, staff?, beam*, notations*, lyric*, play?)>
//
// The position and printout entities for printing suggestions
// are defined in the common.mod file.
// The print-leger attribute is used to indicate whether leger
// lines are printed. Notes without leger lines are used to
// indicate indeterminate high and low notes. By default, it
// is set to yes. If print-object is set to no, print-leger
// is interpreted to also be set to no if not present. This
// attribute is ignored for rests.
// The dynamics and end-dynamics attributes correspond to
// MIDI 1.0's Note On and Note Off velocities, respectively.
// They are expressed in terms of percentages of the default
// forte value (90 for MIDI 1.0).
// The attack and release attributes are used to alter the
// starting and stopping time of the note from when it would
// otherwise occur based on the flow of durations - information
// that is specific to a performance. They are expressed in
// terms of divisions, either positive or negative. A note that
// starts a tie should not have a release attribute, and a note
// that stops a tie should not have an attack attribute. The
// attack and release attributes are independent of each other.
// The attack attribute only changes the starting time of a
// note, and the release attribute only changes the stopping
// time of a note.
// If a note is played only particular times through a repeat,
// the time-only entity shows which times to play the note.
// The pizzicato attribute is used when just this note is
// sounded pizzicato, vs. the pizzicato element which changes
// overall playback between pizzicato and arco.
//
// <!ATTLIST note
//     %print-style;
//     %printout;
//     print-leger %yes-no; #IMPLIED
//     dynamics CDATA #IMPLIED
//     end-dynamics CDATA #IMPLIED
//     attack CDATA #IMPLIED
//     release CDATA #IMPLIED
//     %time-only;
//     pizzicato %yes-no; #IMPLIED
//     %optional-unique-id;
// >
public struct Note: Decodable, Equatable {

    // (
    //   (
    //      (
    //          grace,
    //          (
    //              (%full-note;, (tie, tie?)?) | (cue, %full-note;)
    //          )
    //      )
    //   |
    //   (cue, %full-note;, duration)
    //   |
    //   (
    //      %full-note;, duration, (tie, tie?)?
    //   )
    // )
    // TODO: Kind

    public enum CodingKeys: String, CodingKey {
        case pitch
        case duration
        case durationType = "type"
        case accidental
    }

    let pitch: Pitch
    let duration: Int // amount of "divisions"
    let durationType: DurationType
    let accidental: Accidental?
}

// > Pitch is represented as a combination of the step of the
// > diatonic scale, the chromatic alteration, and the octave.
// > The step element uses the English letters A through G.
// > The alter element represents chromatic alteration in
// > number of semitones (e.g., -1 for flat, 1 for sharp).
// > Decimal values like 0.5 (quarter tone sharp) are
// > used for microtones. The octave element is represented
// > by the numbers 0 to 9, where 4 indicates the octave
// > started by middle C.
//
// <!ELEMENT pitch (step, alter?, octave)>
// <!ELEMENT step (#PCDATA)>
// <!ELEMENT alter (#PCDATA)>
// <!ELEMENT octave (#PCDATA)>
public struct Pitch: Decodable, Equatable {
    
    let step: Step
    let alter: Double?
    let octave: Int

    public init(step: Step, alter: Double?, octave: Int) {
        self.step = step
        self.alter = alter
        self.octave = octave
    }
}

// Type indicates the graphic note type, Valid values (from
// shortest to longest) are 1024th, 512th, 256th, 128th,
// 64th, 32nd, 16th, eighth, quarter, half, whole, breve,
// long, and maxima.
//
// The size attribute indicates full, cue,
// grace-cue, or large size. The default is full for regular
// notes, grace-cue for notes that contain both grace and cue
// elements, and cue for notes that contain either a cue or a
// grace element, but not both.
//
// <!ELEMENT type (#PCDATA)>
// <!ATTLIST type
//     size %symbol-size; #IMPLIED
// >
//
// Note: This type "type" must be called something other than `Type`, for the reason that it is
// totally ambiguous as to what type of type we are talking about, and that it conflicts with
// the swift `Type` (Metatype) static value present on all types.
public struct DurationType: Decodable, Equatable {

    public enum CodingKeys: String, CodingKey {
        case kind = "type"
        case size
    }

    public enum Size: String, Decodable {
        case full = "full"
        case cue = "cue"
        case graceCue = "grace-cue"
        case large = "large"
    }

    let kind: NoteTypeValue
    let size: Size?

    public init(kind: NoteTypeValue, size: Size?) {
        self.kind = kind
        self.size = size
    }

    #warning("FIXME: Handle DurationType.size decoding, which is blocked by XMLCoder limitation")
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.kind = try container.decode(NoteTypeValue.self)
        self.size = nil
    }
}



// <!ELEMENT slide (#PCDATA)>
// <!ATTLIST slide
//    type %start-stop; #REQUIRED
//    number %number-level; "1"
//    %line-type;
//    %dashed-formatting;
//    %print-style;
//    %bend-sound;
//    %optional-unique-id;
// >
public struct Slide {
    public enum Kind: String {
        case start
        case stop
    }
    let kind: Kind
    let lineType: LineType
    let dashedFormatting: DashedFormatting
    let printStyle: PrintStyle
    let bendSound: BendSound
    let id: String?
}

//    The other-notation element is used to define any notations not
//    yet in the MusicXML format. It handles notations where more
//    specific extension elements such as other-dynamics and
//    other-technical are not appropriate. The smufl attribute can
//    be used to specify a particular notation, allowing application
//    interoperability without requiring every SMuFL glyph to have a
//    MusicXML element equivalent. Using the other-notation element
//    without the smufl attribute allows for extended representation,
//    though without application interoperability.
//
// <!ELEMENT other-notation (#PCDATA)>
// <!ATTLIST other-notation
//    type %start-stop-single; #REQUIRED
//    number %number-level; "1"
//    %print-object;
//    %print-style;
//    %placement;
//    %smufl;
//    %optional-unique-id;
// >
public struct OtherNotation {
    let value: String
    let type: StartStopSingle
    let number: NumberLevel
    let printObject: Bool
    let printStyle: PrintStyle
    let placement: Placement
    let smufl: SMuFL
    let id: String?
}

//    Ornaments can be any of several types, followed optionally
//    by accidentals. The accidental-mark element's content is
//    represented the same as an accidental element, but with a
//    different name to reflect the different musical meaning.
//
// <!ELEMENT ornaments
//    (((trill-mark | turn | delayed-turn | inverted-turn |
//       delayed-inverted-turn | vertical-turn |
//       inverted-vertical-turn | shake | wavy-line |
//       mordent | inverted-mordent | schleifer | tremolo |
//       haydn | other-ornament), accidental-mark*)*)>
// <!ATTLIST ornaments
//    %optional-unique-id;
// >
public struct Ornaments {
    #warning("TODO: Ornaments")
}
// <!ELEMENT trill-mark EMPTY>
// <!ATTLIST trill-mark
//    %print-style;
//    %placement;
//    %trill-sound;
//>
//
//    The turn and delayed-turn elements are the normal turn
//    shape which goes up then down. The inverted-turn and
//    delayed-inverted-turn elements have the shape which goes
//    down and then up. The delayed-turn and delayed-inverted-turn
//    elements indicate turns that are delayed until the end of the
//    current note. The vertical-turn element has the shape
//    arranged vertically going from upper left to lower right.
//    If the slash attribute is yes, then a vertical line is used
//    to slash the turn; it is no by default.
//
// <!ELEMENT turn EMPTY>
// <!ATTLIST turn
//    %print-style;
//    %placement;
//    %trill-sound;
//    slash %yes-no; #IMPLIED
// >
// <!ELEMENT delayed-turn EMPTY>
// <!ATTLIST delayed-turn
//    %print-style;
//    %placement;
//    %trill-sound;
//    slash %yes-no; #IMPLIED
// >
// <!ELEMENT inverted-turn EMPTY>
// <!ATTLIST inverted-turn
//    %print-style;
//    %placement;
//    %trill-sound;
//    slash %yes-no; #IMPLIED
// >
// <!ELEMENT delayed-inverted-turn EMPTY>
// <!ATTLIST delayed-inverted-turn
//    %print-style;
//    %placement;
//    %trill-sound;
//    slash %yes-no; #IMPLIED
// >
// <!ELEMENT vertical-turn EMPTY>
// <!ATTLIST vertical-turn
//    %print-style;
//    %placement;
//    %trill-sound;
// >
//
// <!ELEMENT inverted-vertical-turn EMPTY>
// <!ATTLIST inverted-vertical-turn
//    %print-style;
//    %placement;
//    %trill-sound;
// >
//
// <!ELEMENT shake EMPTY>
// <!ATTLIST shake
//    %print-style;
//    %placement;
//    %trill-sound;
// >
//
//    The wavy-line element is defined in the common.mod file,
//    as it applies to more than just note elements.
//
//    The long attribute for the mordent and inverted-mordent
//    elements is "no" by default. The mordent element represents
//    the mordent sign with the vertical line; the inverted-mordent
//    element represents the mordent sign without the vertical line.
//    The choice of which mordent is inverted differs between
//    MusicXML and SMuFL. The approach and departure attributes are
//    used for compound ornaments, indicating how the beginning and
//    ending of the ornament look relative to the main part of the
//    mordent.
//
// <!ELEMENT mordent EMPTY>
// <!ATTLIST mordent
//    long %yes-no; #IMPLIED
//    approach %above-below; #IMPLIED
//    departure %above-below; #IMPLIED
//    %print-style;
//    %placement;
//    %trill-sound;
// >
// <!ELEMENT inverted-mordent EMPTY>
// <!ATTLIST inverted-mordent
//    long %yes-no; #IMPLIED
//    approach %above-below; #IMPLIED
//    departure %above-below; #IMPLIED
//    %print-style;
//    %placement;
//    %trill-sound;
// >
//
//    The name for this ornament is based on the German,
//    to avoid confusion with the more common slide element
//    defined earlier.
//
// <!ELEMENT schleifer EMPTY>
// <!ATTLIST schleifer
//    %print-style;
//    %placement;
// >
//
//    The tremolo ornament can be used to indicate either
//    single-note, double-note, or unmeasured tremolos.
//    Single-note tremolos use the single type, double-note
//    tremolos use the start and stop types, and unmeasured
//    tremolos use the unmeasured type. The default is "single"
//    for compatibility with Version 1.1. The text of the element
//    indicates the number of tremolo marks and is an integer
//    from 0 to 8. Note that the number of attached beams is not
//    included in this value, but is represented separately using
//    the beam element. The value should be 0 for unmeasured
//    tremolos.
//    When using double-note tremolos, the duration of each note
//    in the tremolo should correspond to half of the notated type
//    value. A time-modification element should also be added with
//    an actual-notes value of 2 and a normal-notes value of 1. If
//    used within a tuplet, this 2/1 ratio should be multiplied by
//    the existing tuplet ratio.
//    The smufl attribute specifies the glyph to use from the SMuFL
//    tremolos range for an unmeasured tremolo. It is ignored for
//    other tremolo types. The SMuFL buzzRoll glyph is used by
//    default if the attribute is missing.
//    Using repeater beams for indicating tremolos is deprecated as
//    of MusicXML 3.0.
//-->
//<!ELEMENT tremolo (#PCDATA)>
//<!ATTLIST tremolo
//    type %tremolo-type; "single"
//    %print-style;
//    %placement;
//    %smufl;
//>
//
//<!--
//    The haydn element represents the Haydn ornament. This is
//    defined in SMuFL as ornamentHaydn.
//-->
//<!ELEMENT haydn EMPTY>
//<!ATTLIST haydn
//    %print-style;
//    %placement;
//    %trill-sound;
//>
//
//<!--
//    The other-ornament element is used to define any ornaments
//    not yet in the MusicXML format. The smufl attribute can be
//    used to specify a particular ornament, allowing application
//    interoperability without requiring every SMuFL ornament to have
//    a MusicXML element equivalent. Using the other-ornament element
//    without the smufl attribute allows for extended representation,
//    though without application interoperability.
//-->
//<!ELEMENT other-ornament (#PCDATA)>
//<!ATTLIST other-ornament
//    %print-style;
//    %placement;
//    %smufl;
//>
//
//<!--

//
//<!--
//    Technical indications give performance information for
//    individual instruments.
//-->
//<!ELEMENT technical
//    ((up-bow | down-bow | harmonic | open-string |
//      thumb-position | fingering | pluck | double-tongue |
//      triple-tongue | stopped | snap-pizzicato | fret |
//      string | hammer-on | pull-off | bend | tap | heel |
//      toe | fingernails | hole | arrow | handbell |
//      brass-bend | flip | smear | open | half-muted |
//      harmon-mute | golpe | other-technical)*)>
//<!ATTLIST technical
//    %optional-unique-id;
//>
public struct Technical {
    #warning("TODO: Technical")
}

//
//<!--
//    The up-bow element represents the symbol that is used both
//    for up-bowing on bowed instruments, and up-stroke on plucked
//    instruments.
//-->
//<!ELEMENT up-bow EMPTY>
//<!ATTLIST up-bow
//    %print-style;
//    %placement;
//>
//
//<!--
//    The down-bow element represents the symbol that is used both
//    for down-bowing on bowed instruments, and down-stroke on
//    plucked instruments.
//-->
//<!ELEMENT down-bow EMPTY>
//<!ATTLIST down-bow
//    %print-style;
//    %placement;
//>
//
//<!--
//    The harmonic element indicates natural and artificial
//    harmonics. Natural harmonics usually notate the base
//    pitch rather than the sounding pitch. Allowing the type
//    of pitch to be specified, combined with controls for
//    appearance/playback differences, allows both the notation
//    and the sound to be represented. Artificial harmonics can
//    add a notated touching-pitch; the pitch or fret at which
//    the string is touched lightly to produce the harmonic.
//    Artificial pinch harmonics will usually not notate a
//    touching pitch. The attributes for the harmonic element
//    refer to the use of the circular harmonic symbol, typically
//    but not always used with natural harmonics.
//-->
//<!ELEMENT harmonic
//    ((natural | artificial)?,
//     (base-pitch | touching-pitch | sounding-pitch)?)>
//<!ATTLIST harmonic
//    %print-object;
//    %print-style;
//    %placement;
//>
//<!ELEMENT natural EMPTY>
//<!ELEMENT artificial EMPTY>
//<!ELEMENT base-pitch EMPTY>
//<!ELEMENT touching-pitch EMPTY>
//<!ELEMENT sounding-pitch EMPTY>
//
//<!--
//    The open-string element represents the zero-shaped
//    open string symbol.
//-->
//<!ELEMENT open-string EMPTY>
//<!ATTLIST open-string
//    %print-style;
//    %placement;
//>
//
//<!--
//    The thumb-position element represents the thumb position
//    symbol. This is a circle with a line, where the line does
//    not come within the circle. It is distinct from the snap
//    pizzicato symbol, where the line comes inside the circle.
//-->
//<!ELEMENT thumb-position EMPTY>
//<!ATTLIST thumb-position
//    %print-style;
//    %placement;
//>
//
//<!--
//    The pluck element is used to specify the plucking fingering
//    on a fretted instrument, where the fingering element refers
//    to the fretting fingering. Typical values are p, i, m, a for
//    pulgar/thumb, indicio/index, medio/middle, and anular/ring
//    fingers.
//-->
//<!ELEMENT pluck (#PCDATA)>
//<!ATTLIST pluck
//    %print-style;
//    %placement;
//>
//
//<!--
//    The double-tongue element represents the double tongue symbol
//    (two dots arranged horizontally).
//-->
//<!ELEMENT double-tongue EMPTY>
//<!ATTLIST double-tongue
//    %print-style;
//    %placement;
//>
//
//<!--
//    The triple-tongue element represents the triple tongue symbol
//    (three dots arranged horizontally).
//-->
//<!ELEMENT triple-tongue EMPTY>
//<!ATTLIST triple-tongue
//    %print-style;
//    %placement;
//>
//
//<!--
//    The stopped element represents the stopped symbol, which
//    looks like a plus sign. The smufl attribute can be used to
//    distinguish different SMuFL glyphs that have a similar
//    appearance such as handbellsMalletBellSuspended and
//    guitarClosePedal. If not present, the default glyph is
//    brassMuteClosed.
//-->
//<!ELEMENT stopped EMPTY>
//<!ATTLIST stopped
//    %print-style;
//    %placement;
//    %smufl;
//>
//
//<!--
//    The snap-pizzicato element represents the snap pizzicato
//    symbol. This is a circle with a line, where the line comes
//    inside the circle. It is distinct from the thumb-position
//    symbol, where the line does not come inside the circle.
//-->
//<!ELEMENT snap-pizzicato EMPTY>
//<!ATTLIST snap-pizzicato
//    %print-style;
//    %placement;
//>
//
//<!--
//    The hammer-on and pull-off elements are used in guitar
//    and fretted instrument notation. Since a single slur
//    can be marked over many notes, the hammer-on and pull-off
//    elements are separate so the individual pair of notes can
//    be specified. The element content can be used to specify
//    how the hammer-on or pull-off should be notated. An empty
//    element leaves this choice up to the application.
//-->
//<!ELEMENT hammer-on (#PCDATA)>
//<!ATTLIST hammer-on
//    type %start-stop; #REQUIRED
//    number %number-level; "1"
//    %print-style;
//    %placement;
//>
//<!ELEMENT pull-off (#PCDATA)>
//<!ATTLIST pull-off
//    type %start-stop; #REQUIRED
//    number %number-level; "1"
//    %print-style;
//    %placement;
//>
//
//<!--
//    The bend element is used in guitar and tablature. The
//    bend-alter element indicates the number of steps in the
//    bend, similar to the alter element. As with the alter
//    element, numbers like 0.5 can be used to indicate
//    microtones. Negative numbers indicate pre-bends or
//    releases; the pre-bend and release elements are used
//    to distinguish what is intended. A with-bar element
//    indicates that the bend is to be done at the bridge
//    with a whammy or vibrato bar. The content of the
//    element indicates how this should be notated. Content
//    values of "scoop" and "dip" refer to the SMuFL
//    guitarVibratoBarScoop and guitarVibratoBarDip glyphs.
//-->
//<!ELEMENT bend
//    (bend-alter, (pre-bend | release)?, with-bar?)>
//<!ATTLIST bend
//    %print-style;
//    %bend-sound;
//>
//<!ELEMENT bend-alter (#PCDATA)>
//<!ELEMENT pre-bend EMPTY>
//<!ELEMENT release EMPTY>
//<!ELEMENT with-bar (#PCDATA)>
//<!ATTLIST with-bar
//    %print-style;
//    %placement;
//>
//
//<!--
//    The tap element indicates a tap on the fretboard. The
//    text content allows specification of the notation; + and
//    T are common choices. If the element is empty, the hand
//    attribute is used to specify the symbol to use. The left
//    and right values refer to the SMuFL guitarLeftHandTapping
//    and guitarRightHandTapping glyphs respectively. The hand
//    attribute is ignored if the tap glyph is already specified
//    by the text content. If neither text content nor the hand
//    attribute are present, the display is application-specific.
//-->
//<!ELEMENT tap (#PCDATA)>
//<!ATTLIST tap
//    hand (left | right) #IMPLIED
//    %print-style;
//    %placement;
//>
//
//<!--
//    The heel and toe element are used with organ pedals. The
//    substitution value is "no" if the attribute is not present.
//-->
//<!ELEMENT heel EMPTY>
//<!ATTLIST heel
//    substitution %yes-no; #IMPLIED
//    %print-style;
//    %placement;
//>
//<!ELEMENT toe EMPTY>
//<!ATTLIST toe
//    substitution %yes-no; #IMPLIED
//    %print-style;
//    %placement;
//>
//
//<!--
//    The fingernails element is used in notation for harp and
//    other plucked string instruments.
//-->
//<!ELEMENT fingernails EMPTY>
//<!ATTLIST fingernails
//    %print-style;
//    %placement;
//>
//
//<!--
//    The hole element represents the symbols used for woodwind
//    and brass fingerings as well as other notations. The content
//    of the optional hole-type element indicates what the hole
//    symbol represents in terms of instrument fingering or other
//    techniques. The hole-closed element represents whether the
//    hole is closed, open, or half-open. Valid element values are
//    yes, no, and half. The optional location attribute indicates
//    which portion of the hole is filled in when the element value
//    is half. The optional hole-shape element indicates the shape
//    of the hole symbol; the default is a circle.
//-->
//<!ELEMENT hole (hole-type?, hole-closed, hole-shape?)>
//<!ATTLIST hole
//    %print-style;
//    %placement;
//>
//<!ELEMENT hole-type (#PCDATA)>
//<!ELEMENT hole-closed (#PCDATA)>
//<!ATTLIST hole-closed
//    location (right | bottom | left | top) #IMPLIED
//>
//<!ELEMENT hole-shape (#PCDATA)>
//


//
//<!--
//    The handbell element represents notation for various
//    techniques used in handbell and handchime music. Valid
//    values are belltree, damp, echo, gyro, hand martellato,
//    mallet lift, mallet table, martellato, martellato lift,
//    muted martellato, pluck lift, and swing.
//-->
//<!ELEMENT handbell (#PCDATA)>
//<!ATTLIST handbell
//    %print-style;
//    %placement;
//>
//
//<!--
//    The brass-bend element represents the u-shaped bend symbol
//    used in brass notation, distinct from the bend element used
//    in guitar music.
//-->
//<!ELEMENT brass-bend EMPTY>
//<!ATTLIST brass-bend
//    %print-style;
//    %placement;
//>
//
//<!--
//    The flip element represents the flip symbol used in
//    brass notation.
//-->
//<!ELEMENT flip EMPTY>
//<!ATTLIST flip
//    %print-style;
//    %placement;
//>
//
//<!--
//    The smear element represents the tilde-shaped smear symbol
//    used in brass notation.
//-->
//<!ELEMENT smear EMPTY>
//<!ATTLIST smear
//    %print-style;
//    %placement;
//>
//
//<!--
//    The open element represents the open symbol, which
//    looks like a circle. The smufl attribute can be used to
//    distinguish different SMuFL glyphs that have a similar
//    appearance such as brassMuteOpen and guitarOpenPedal.
//    If not present, the default glyph is brassMuteOpen.
//-->
//<!ELEMENT open EMPTY>
//<!ATTLIST open
//    %print-style;
//    %placement;
//    %smufl;
//>
//
//<!--
//    The half-muted element represents the half-muted symbol,
//    which looks like a circle with a plus sign inside. The
//    smufl attribute can be used to distinguish different
//    SMuFL glyphs that have a similar appearance such as
//    brassMuteHalfClosed and guitarHalfOpenPedal. If not
//    present, the default glyph is brassMuteHalfClosed.
//-->
//<!ELEMENT half-muted EMPTY>
//<!ATTLIST half-muted
//    %print-style;
//    %placement;
//    %smufl;
//>
//
//<!--
//    The harmon-mute element represents the symbols used for
//    harmon mutes in brass notation. The harmon-closed element
//    represents whether the mute is closed, open, or half-open.
//    Valid element values are yes, no, and half. The optional
//    location attribute indicates which portion of the symbol
//    is filled in when the element value is half.
//-->
//<!ELEMENT harmon-mute (harmon-closed)>
//<!ATTLIST harmon-mute
//    %print-style;
//    %placement;
//>
//<!ELEMENT harmon-closed (#PCDATA)>
//<!ATTLIST harmon-closed
//    location (right | bottom | left | top) #IMPLIED
//>
//
//<!--
//    The golpe element represents the golpe symbol that is used
//    for tapping the pick guard in guitar music.
//-->
//<!ELEMENT golpe EMPTY>
//<!ATTLIST golpe
//    %print-style;
//    %placement;
//>
//
//<!--
//    The other-technical element is used to define any technical
//    indications not yet in the MusicXML format. The smufl attribute
//    can be used to specify a particular glyph, allowing application
//    interoperability without requiring every SMuFL technical
//    indication to have a MusicXML element equivalent. Using the
//    other-technical element without the smufl attribute allows
//    for extended representation, though without application
//    interoperability.
//-->
//<!ELEMENT other-technical (#PCDATA)>
//<!ATTLIST other-technical
//    %print-style;
//    %placement;
//    %smufl;
//>

// <!ELEMENT text (#PCDATA)>
// <!ATTLIST text
//     %font;
//     %color;
//     %text-decoration;
//     %text-rotation;
//     %letter-spacing;
//     xml:lang NMTOKEN #IMPLIED
//     %text-direction;
// >
public struct Text {
    let value: String
    let font: Font
    let color: Color
    let decoration: TextDecoration
    let rotation: TextRotation
    let letterSpacing: LetterSpacing
    let direction: TextDirection
}

// <!ELEMENT syllabic (#PCDATA)>
//
//     The elision element represents an elision between lyric
//     syllables. The text content specifies the symbol used to
//     display the elision. Common values are a no-break space
//     (Unicode 00A0), an underscore (Unicode 005F), or an undertie
//     (Unicode 203F). If the text content is empty, the smufl
//     attribute is used to specify the symbol to use. Its value
//     is a SMuFL canonical glyph name that starts with lyrics.
//     The SMuFL attribute is ignored if the elision glyph is
//     already specified by the text content. If neither text
//     content nor a smufl attribute are present, the elision
//     glyph is application-specific.
//
// <!ELEMENT elision (#PCDATA)>
// <!ATTLIST elision
//     %font;
//     %color;
//     %smufl;
// >
//
// <!ELEMENT laughing EMPTY>
// <!ELEMENT humming EMPTY>
// <!ELEMENT end-line EMPTY>
// <!ELEMENT end-paragraph EMPTY>




//    The common note elements between cue/grace notes and
//    regular (full) notes: pitch, chord, and rest information,
//    but not duration (cue and grace notes do not have
//    duration encoded here). Unpitched elements are used for
//    unpitched percussion, speaking voice, and other musical
//    elements lacking determinate pitch.
//
//<!ENTITY % full-note "(chord?, (pitch | unpitched | rest))">
public struct FullNote {

    enum Kind {
        case pitch(Pitch)
        case unpitched(Unpitched)
        case rest(Rest)
    }

    let kind: Kind
    let chord: Bool
}
//
//<!-- Elements -->
//
//<!--
//    The cue element indicates the presence of a cue note.
//    In MusicXML, a cue note is a silent note with no playback.
//    Normal notes that play can be specified as cue size using
//    the type element. A cue note that is specified as full size
//    using the type element will still remain silent.
//-->
//<!ELEMENT cue EMPTY>
//
//<!--
//    The grace element indicates the presence of a grace note.
//    The slash attribute for a grace note is yes for slashed
//    eighth notes. The other grace note attributes come from
//    MuseData sound suggestions. The steal-time-previous attribute
//    indicates the percentage of time to steal from the previous
//    note for the grace note. The steal-time-following attribute
//    indicates the percentage of time to steal from the following
//    note for the grace note, as for appoggiaturas. The make-time
//    attribute indicates to make time, not steal time; the units
//    are in real-time divisions for the grace note.
//-->
//<!ELEMENT grace EMPTY>
//<!ATTLIST grace
//    steal-time-previous CDATA #IMPLIED
//    steal-time-following CDATA #IMPLIED
//    make-time CDATA #IMPLIED
//    slash %yes-no; #IMPLIED
//>
//
//<!--
//    The chord element indicates that this note is an additional
//    chord tone with the preceding note. The duration of this
//    note can be no longer than the preceding note. In MuseData,
//    a missing duration indicates the same length as the previous
//    note, but the MusicXML format requires a duration for chord
//    notes too.
//-->
//<!ELEMENT chord EMPTY>
//

//    The unpitched element indicates musical elements that are
//    notated on the staff but lack definite pitch, such as
//    unpitched percussion and speaking voice. Like notes, it
//    uses step and octave elements to indicate placement on the
//    staff, following the current clef. If percussion clef is
//    used, the display-step and display-octave elements are
//    interpreted as if in treble clef, with a G in octave 4 on
//    line 2. If not present, the note is placed on the middle
//    line of the staff, generally used for a one-line staff.
//
// <!ELEMENT unpitched ((display-step, display-octave)?)>
// <!ELEMENT display-step (#PCDATA)>
// <!ELEMENT display-octave (#PCDATA)>
public struct Unpitched: Decodable, Equatable {
    let displayStep: Int
    let displayOctave: Int
}

//    The rest element indicates notated rests or silences. Rest
//    elements are usually empty, but placement on the staff can
//    be specified using display-step and display-octave
//    elements. If the measure attribute is set to yes, it
//    indicates this is a complete measure rest.
//
// <!ELEMENT rest ((display-step, display-octave)?)>
// <!ATTLIST rest
//    measure %yes-no; #IMPLIED
// >
public struct Rest: Decodable, Equatable {
    let displayStep: Int?
    let displayOctave: Int?
    let measure: Bool
}

//
//<!--
//    Duration is a positive number specified in division units.
//    This is the intended duration vs. notated duration (for
//    instance, swing eighths vs. even eighths, or differences
//    in dotted notes in Baroque-era music). Differences in
//    duration specific to an interpretation or performance
//    should use the note element's attack and release
//    attributes.
//    The tie element indicates that a tie begins or ends with
//    this note. If the tie element applies only particular times
//    through a repeat, the time-only attribute indicates which
//    times to apply it. The tie element indicates sound; the tied
//    element indicates notation.
//-->
//<!ELEMENT duration (#PCDATA)>
//<!ELEMENT tie EMPTY>
//<!ATTLIST tie
//    type %start-stop; #REQUIRED
//    %time-only;
//>
//
//<!--
//    If multiple score-instruments are specified on a
//    score-part, there should be an instrument element for
//    each note in the part. The id attribute is an IDREF back
//    to the score-instrument ID.
//-->
//<!ELEMENT instrument EMPTY>
//<!ATTLIST instrument
//    id IDREF #REQUIRED
//>
//
//
//<!--
//    One dot element is used for each dot of prolongation.
//    The placement element is used to specify whether the
//    dot should appear above or below the staff line. It is
//    ignored for notes that appear on a staff space.
//-->
//<!ELEMENT dot EMPTY>
//<!ATTLIST dot
//    %print-style;
//    %placement;
//>
//

// > Stems can be down, up, none, or double. For down and up
// > stems, the position attributes can be used to specify
// > stem length. The relative values specify the end of the
// > stem relative to the program default. Default values
// > specify an absolute end stem position. Negative values of
// > relative-y that would flip a stem instead of shortening
// > it are ignored. A stem element associated with a rest
// > refers to a stemlet.
//
// <!ELEMENT stem (#PCDATA)>
// <!ATTLIST stem
//    %position;
//    %color;
// >
public struct Stem {
    let value: StemValue
    let position: Position
    let color: Color
}

// > The notehead element indicates shapes other than the open
// > and closed ovals associated with note durations.  The fa up shape is typically used with upstems;
// > the fa shape is typically used with downstems or no stems.
// > The arrow shapes differ from triangle and inverted triangle
// > by being centered on the stem. Slashed and back slashed
// > notes include both the normal notehead and a slash. The
// > triangle shape has the tip of the triangle pointing up;
// > the inverted triangle shape has the tip of the triangle
// > pointing down. The left triangle shape is a right triangle
// > with the hypotenuse facing up and to the left.
// > The other notehead covers noteheads other than those listed
// > here. It is usually used in combination with the smufl
// > attribute to specify a particular SMuFL notehead. The
// > smufl attribute may be used with any notehead value to
// > help specify the appearance of symbols that share the same
// > MusicXML semantics. Its value is a SMuFL canonical glyph
// > name. Noteheads in the SMuFL "Note name noteheads" range
// > (U+E150–U+E1AF) should not use the smufl attribute or the
// > "other" value, but instead use the notehead-text element.
// > For the enclosed shapes, the default is to be hollow for
// > half notes and longer, and filled otherwise. The filled
// > attribute can be set to change this if needed.
// > If the parentheses attribute is set to yes, the notehead
// > is parenthesized. It is no by default.
// > The notehead-text element indicates text that is displayed
// > inside a notehead, as is done in some educational music.
// > It is not needed for the numbers used in tablature or jianpu
// > notation. The presence of a TAB or jianpu clefs is sufficient
// > to indicate that numbers are used. The display-text and
// > accidental-text elements allow display of fully formatted
// > text and accidentals.
//
// <!ELEMENT notehead (#PCDATA)>
// <!ATTLIST notehead
//    filled %yes-no; #IMPLIED
//    parentheses %yes-no; #IMPLIED
//    %font;
//    %color;
//    %smufl;
// >
public struct Notehead {
    let value: NoteheadValue
    let filled: Bool
    let parentheses: Bool
    let font: Font
    let color: Color
    let smufl: SMuFL
}

// <!ELEMENT notehead-text
//    ((display-text | accidental-text)+)>
public struct NoteheadText {
    enum Kind {
        case displayText(DisplayText)
        case accidentalText(AccidentalText)
    }
    // TODO: Use `NonEmpty`
    let values: [Kind]
}



// > Notations are musical notations, not XML notations. Multiple
// > notations are allowed in order to represent multiple editorial
// > levels. The print-object attribute, added in Version 3.0,
// > allows notations to represent details of performance technique,
// > such as fingerings, without having them appear in the score.
//
// <!ELEMENT notations
//    (%editorial;,
//     (tied | slur | tuplet | glissando | slide |
//      ornaments | technical | articulations | dynamics |
//      fermata | arpeggiate | non-arpeggiate |
//      accidental-mark | other-notation)*)>
// <!ATTLIST notations
//    %print-object;
//    %optional-unique-id;
// >
public struct Notations {

    public enum Notation {
        case tied(Tied)
        case slur(Slur)
        case tuplet(Tuplet)
        case glissando(Glissando)
        case slide(Slide)
        case ornaments(Ornaments)
        case technical(Technical)
        case articulations(Articulations)
        case dynamics(Dynamics)
        case fermata(Fermata)
        case arpeggiate(Arpeggiate)
        case nonArpeggiate(NonArpeggiate)
        case accidentalMark(AccidentalMark)
        case other(OtherNotation)
    }

    // MARK: Attributes

    let editorial: Editorial
    let values: [Notation]
    let printObject: Bool
    let id: Int?
}

// > The non-arpeggiate element indicates that this note is at
// > the top or bottom of a bracket indicating to not arpeggiate
// > these notes. Since this does not involve playback, it is
// > only used on the top or bottom notes, not on each note
// > as for the arpeggiate element.
//
// <!ELEMENT non-arpeggiate EMPTY>
// <!ATTLIST non-arpeggiate
//    type %top-bottom; #REQUIRED
//    number %number-level; #IMPLIED
//    %position;
//    %placement;
//    %color;
//    %optional-unique-id;
// >
// TODO: Appearance
public struct NonArpeggiate {

    public enum Kind {
        case top
        case bottom
    }

    let kind: Kind
    let number: Int
    let position: Position
    let placement: Placement
    let color: Color
    let id: String?
}


// > The tied element represents the notated tie. The tie element
// > represents the tie sound.
// > The number attribute is rarely needed to disambiguate ties,
// > since note pitches will usually suffice. The attribute is
// > implied rather than defaulting to 1 as with most elements. It is
// > available for use in more complex tied notation situations.
// > Ties that join two notes of the same pitch together should be
// > represented with a tied element on the first note with
// > type="start" and a tied element on the second note with
// > type="stop".  This can also be done if the two notes being tied
// > are enharmonically equivalent, but have different step values. It
// > is not recommended to use tied elements to join two notes with
// > enharmonically inequivalent pitches.
// > Ties that indicate that an instrument should be undamped are
// > specified with a single tied element with type="let-ring".
// > Ties that are visually attached to only one note, other than
// > undamped ties, should be specified with two tied elements on the
// > same note, first type="start" then type="stop". This can be used
// > to represent ties into or out of repeated sections or codas.
//
// <!ELEMENT tied EMPTY>
// <!ATTLIST tied
//    type %tied-type; #REQUIRED
//    number %number-level; #IMPLIED
//    %line-type;
//    %dashed-formatting;
//    %position;
//    %placement;
//    %orientation;
//    %bezier;
//    %color;
//    %optional-unique-id;
//>
public struct Tied {

    // MARK: - Attributes

    // FIXME: Nest as `Kind`
    let type: TiedType
    let number: NumberLevel
    let lineType: LineType
    let dashedFormatting: DashedFormatting
    let position: Position
    let placement: Placement
    let orientation: Orientation
    let bezier: Bezier
    let color: Color
    let id: Int?
}

// > Slur elements are empty. Most slurs are represented with
// > two elements: one with a start type, and one with a stop
// > type. Slurs can add more elements using a continue type.
// > This is typically used to specify the formatting of cross-
// > system slurs, or to specify the shape of very complex slurs.
//
//<!ELEMENT slur EMPTY>
//<!ATTLIST slur
//    type %start-stop-continue; #REQUIRED
//    number %number-level; "1"
//    %line-type;
//    %dashed-formatting;
//    %position;
//    %placement;
//    %orientation;
//    %bezier;
//    %color;
//    %optional-unique-id;
//>
public struct Slur {

    // MARK: - Attributes

    let type: StartStopContinue
    let number: NumberLevel = .one
    let lineType: LineType
    let dashedFormatting: DashedFormatting
    let position: Position
    let placement: Placement
    let orientation: Orientation
    let bezier: Bezier
    let color: Color
    let id: Int?
}

// > A tuplet element is present when a tuplet is to be displayed
// > graphically, in addition to the sound data provided by the
// > time-modification elements. The number attribute is used to
// > distinguish nested tuplets. The bracket attribute is used
// > to indicate the presence of a bracket. If unspecified, the
// > results are implementation-dependent. The line-shape
// > attribute is used to specify whether the bracket is straight
// > or in the older curved or slurred style. It is straight by
// > default.
// > Whereas a time-modification element shows how the cumulative,
// > sounding effect of tuplets and double-note tremolos compare to
// > the written note type, the tuplet element describes how this
// > is displayed. The tuplet element also provides more detailed
// > representation information than the time-modification element,
// > and is needed to represent nested tuplets and other complex
// > tuplets accurately. The tuplet-actual and tuplet-normal
// > elements provide optional full control over tuplet
// > specifications. Each allows the number and note type
// > (including dots) describing a single tuplet. If any of
// > these elements are absent, their values are based on the
// > time-modification element.
// > The show-number attribute is used to display either the
// > number of actual notes, the number of both actual and
// > normal notes, or neither. It is actual by default. The
// > show-type attribute is used to display either the actual
// > type, both the actual and normal types, or neither. It is
// > none by default.
//
// <!ELEMENT tuplet (tuplet-actual?, tuplet-normal?)>
// <!ATTLIST tuplet
//    type %start-stop; #REQUIRED
//    number %number-level; #IMPLIED
//    bracket %yes-no; #IMPLIED
//    show-number (actual | both | none) #IMPLIED
//    show-type (actual | both | none) #IMPLIED
//    %line-shape;
//    %position;
//    %placement;
//    %optional-unique-id;
// >
public struct Tuplet {

    public enum ShowNumber: String {
        case actual
        case both
        case none
    }

    public enum ShowType {
        case actual
        case both
        case none
    }

    // MARK: - Attributes

    let actual: TupletActual?
    let normal: TupletNormal?
    let type: StartStop
    let level: NumberLevel?
    let showNumber: ShowNumber = .none
    let showType: ShowNumber = .none
    let lineShape: LineShape
    let position: Position
    let placement: Placement
    let id: Int?
}

// <!ELEMENT tuplet-actual (tuplet-number?,
//    tuplet-type?, tuplet-dot*)>
public struct TupletActual {
    let number: TupletNumber?
    let type: TupletType?
    let dot: [TupletDot]
}

// <!ELEMENT tuplet-normal (tuplet-number?,
//    tuplet-type?, tuplet-dot*)>
public struct TupletNormal {
    let number: TupletNumber?
    let type: TupletType?
    let dot: [TupletDot]
}

// <!ELEMENT tuplet-number (#PCDATA)>
// <!ATTLIST tuplet-number
//    %font;
//    %color;
// >
public struct TupletNumber {
    let value: Int
    let font: Font
    let color: Color
}

// <!ELEMENT tuplet-type (#PCDATA)>
// <!ATTLIST tuplet-type
//    %font;
//    %color;
// >
public struct TupletType {
    let font: Font
    let color: Color
}

// <!ELEMENT tuplet-dot EMPTY>
// <!ATTLIST tuplet-dot
//    %font;
//    %color;
// >
public struct TupletDot {
    let font: Font
    let color: Color
}
