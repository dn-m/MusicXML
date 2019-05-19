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



