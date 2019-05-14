//
//  Attributes.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//
//  MusicXML attributes.mod module
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
//  The attributes DTD module contains the attributes element
//  and its children, such as key and time signatures.

// > The attributes element contains musical information that
// > typically changes on measure boundaries. This includes
// > key and time signatures, clefs, transpositions, and staving.
// > When attributes are changed mid-measure, it affects the
// > music in score order, not in MusicXML document order.
//
// <!ELEMENT attributes (%editorial;, divisions?, key*, time*,
//    staves?, part-symbol?, instruments?, clef*, staff-details*,
//    transpose*, directive*, measure-style*)>
public struct Attributes: Equatable {

    let editorial: Editorial?
    let divisions: Divisions?
    let keys: [Key]?
    let time: [Time]?
    let staves: Staves?
    let partSymbol: PartSymbol?
    let instruments: Instruments?
    let clefs: [Clef]?
    let staffDetails: [StaffDetails]?
    let transpose: [Transpose]?
    let directive: [Directive]?
    let measureStyles: [MeasureStyle]?
}


// > Clefs are represented by the sign, line, and
// > clef-octave-change elements.
// >
// > Sign values include G, F, C, percussion, TAB, jianpu, and none.
// >
// > Line numbers are
// > counted from the bottom of the staff. Standard values are
// > 2 for the G sign (treble clef), 4 for the F sign (bass clef),
// > 3 for the C sign (alto clef) and 5 for TAB (on a 6-line
// > staff).
// >
// > The clef-octave-change element is used for
// > transposing clefs (e.g., a treble clef for tenors would
// > have a clef-octave-change value of -1). The optional
// > number attribute refers to staff numbers within the part,
// > from top to bottom on the system.
// > A value of 1 is
// > assumed if not present.
// >
// > The jianpu sign indicates that the music that follows
// > should be in jianpu numbered notation, just as the TAB
// > sign indicates that the music that follows should be in
// > tablature notation. Unlike TAB, a jianpu sign does not
// > correspond to a visual clef notation.
// > Sometimes clefs are added to the staff in non-standard
// > line positions, either to indicate cue passages, or when
// > there are multiple clefs present simultaneously on one
// > staff. In this situation, the additional attribute is set to
// > "yes" and the line value is ignored. The size attribute
// > is used for clefs where the additional attribute is "yes".
// > It is typically used to indicate cue clefs.
// > Sometimes clefs at the start of a measure need to appear
// > after the barline rather than before, as for cues or for
// > use after a repeated section. The after-barline attribute
// > is set to "yes" in this situation. The attribute is ignored
// > for mid-measure clefs.
// > Clefs appear at the start of each system unless the
// > print-object attribute has been set to "no" or the
// > additional attribute has been set to "yes".
//
// <!ELEMENT clef (sign, line?, clef-octave-change?)>
// <!ATTLIST clef
//     number CDATA #IMPLIED
//     additional %yes-no; #IMPLIED
//     size %symbol-size; #IMPLIED
//     after-barline %yes-no; #IMPLIED
//     %print-style;
//     %print-object;
//     %optional-unique-id;
// >
// <!ELEMENT sign (#PCDATA)>
// <!ELEMENT line (#PCDATA)>
// <!ELEMENT clef-octave-change (#PCDATA)>
public struct Clef: Decodable, Equatable {
    let sign: ClefSign
    let line: Int?
    public init(sign: ClefSign, line: Int?) {
        self.sign = sign
        self.line = line
    }
}

// > If the part is being encoded for a transposing instrument
// > in written vs. concert pitch, the transposition must be
// > encoded in the transpose element.
//
// <!ELEMENT transpose
//    (diatonic?, chromatic, octave-change?, double?)>
// <!ATTLIST transpose
//    number CDATA #IMPLIED
//    %optional-unique-id;
// >
// <!ELEMENT diatonic (#PCDATA)>
// <!ELEMENT chromatic (#PCDATA)>
// <!ELEMENT octave-change (#PCDATA)>
// <!ELEMENT double EMPTY>
public struct Transpose: Decodable, Equatable {

    // > The optional number attribute refers to staff numbers,
    // > from top to bottom on the system. If absent, the
    // > transposition applies to all staves in the part. Per-staff
    // > transposition is most often used in parts that represent
    // > multiple instruments.
    let id: Int?

    // > The transpose element
    // > represents what must be added to the written pitch to get
    // > the correct sounding pitch.
    let chromatic: Int

    // > The diatonic element is also numeric and allows
    // > for correct spelling of enharmonic transpositions.
    let diatonic: Int?

    // Amount of octave transposition.
    let octave: Int

    // Doubling an octave down
    let doubleDown: Bool

    public init(
        id: Int?,
        chromatic: Int,
        diatonic: Int = 0,
        octave: Int = 0,
        doubleDown: Bool = false
    )
    {
        self.id = id
        self.chromatic = chromatic
        self.diatonic = diatonic
        self.octave = octave
        self.doubleDown = doubleDown
    }
}

// > Staves are used if there is more than one staff
// > represented in the given part (e.g., 2 staves for
// > typical piano parts). If absent, a value of 1 is assumed.
// > Staves are ordered from top to bottom in a part in
// > numerical order, with staff 1 above staff 2.
//
// <!ELEMENT staves (#PCDATA)>
public struct Staves: Decodable, Equatable {
    // FIXME: Do we store names / ids here?
    let count: Int
    public init(count: Int) {
        self.count = count
    }
}

// > The part-symbol element indicates how a symbol for a
// > multi-staff part is indicated in the score. Values include
// > none, brace, line, bracket, and square; brace is the default.
// > The top-staff and bottom-staff elements are used when the
// > brace does not extend across the entire part. For example, in
// > a 3-staff organ part, the top-staff will typically be 1 for
// > the right hand, while the bottom-staff will typically be 2
// > for the left hand. Staff 3 for the pedals is usually outside
// > the brace. By default, the presence of a part-symbol element
// > that does not extend across the entire part also indicates a
// > corresponding change in the common barlines within a part.
//
// <!ELEMENT part-symbol (#PCDATA)>
// <!ATTLIST part-symbol
//    top-staff CDATA #IMPLIED
//    bottom-staff CDATA #IMPLIED
//    %position;
//    %color;
// >
public struct PartSymbol: Decodable, Equatable {
    public enum Kind: String, Decodable {
        case none
        case brace
        case line
        case bracket
        case square
    }
    let kind: Kind
    let topStaff: Int // should this be a name or id?
    let bottomStaff: Int // should this be a name or id?
    let position: Double
    let color: String
    public init(
        kind: Kind = .brace,
        topStaff: Int,
        bottomStaff: Int,
        position: Double,
        color: String
    )
    {
        self.kind = kind
        self.topStaff = topStaff
        self.bottomStaff = bottomStaff
        self.position = position
        self.color = color
    }
}

// > Instruments are only used if more than one instrument is
// > represented in the part (e.g., oboe I and II where they
// > play together most of the time). If absent, a value of 1
// > is assumed.
//
// <!ELEMENT instruments (#PCDATA)>
public struct Instruments: Decodable, Equatable {
    // FIXME: Do we store names / ids here?
    let count: Int
    public init(count: Int) {
        self.count = count
    }
}

// > The tuning-step, tuning-alter, and tuning-octave
// > elements are defined in the common.mod file. Staff
// > lines are numbered from bottom to top.
//
// <!ELEMENT staff-tuning
//    (tuning-step, tuning-alter?, tuning-octave)>
// <!ATTLIST staff-tuning
//    line CDATA #REQUIRED
// >
//
public struct StaffTuning: Decodable, Equatable {
    let step: Int
    let alter: Double
    let octave: Int
    let line: Int
    public init(step: Int, alter: Double, octave: Int, line: Int) {
        self.step = step
        self.alter = alter
        self.octave = octave
        self.line = line
    }
}

// > The staff-details element is used to indicate different
// > types of staves. The staff-type element can be ossia,
// > cue, editorial, regular, or alternate. An alternate staff
// > indicates one that shares the same musical data as the
// > prior staff, but displayed differently (e.g., treble and
// > bass clef, standard notation and tab). The staff-lines
// > element specifies the number of lines for a non 5-line
// > staff. The staff-tuning and capo elements are used to
// > specify tuning when using tablature notation. The optional
// > number attribute specifies the staff number from top to
// > bottom on the system, as with clef. The optional show-frets
// > attribute indicates whether to show tablature frets as
// > numbers (0, 1, 2) or letters (a, b, c). The default choice
// > is numbers. The print-object attribute is used to indicate
// > when a staff is not printed in a part, usually in large
// > scores where empty parts are omitted. It is yes by default.
// > If print-spacing is yes while print-object is no, the score
// > is printed in cutaway format where vertical space is left
// > for the empty part.
//
// <!ELEMENT staff-details (staff-type?, staff-lines?,
//    staff-tuning*, capo?, staff-size?)>
// <!ATTLIST staff-details
//    number         CDATA                #IMPLIED
//    show-frets     (numbers | letters)  #IMPLIED
//    %print-object;
//    %print-spacing;
// >
// <!ELEMENT staff-type (#PCDATA)>
// <!ELEMENT staff-lines (#PCDATA)>
public struct StaffDetails: Decodable, Equatable {
    public enum Kind: String, Decodable {
        case ossia
        case cue
        case editorial
        case regular
        case alternate
    }
    let kind: Kind
    let staffLines: Int
    let staffTuning: StaffTuning
    public init(kind: Kind, staffLines: Int = 5, staffTuning: StaffTuning) {
        self.kind = kind
        self.staffLines = staffLines
        self.staffTuning = staffTuning
    }
}

// > The capo element indicates at which fret a capo should
// > be placed on a fretted instrument. This changes the
// > open tuning of the strings specified by staff-tuning
// > by the specified number of half-steps.
//
// <!ELEMENT capo (#PCDATA)>
public struct Capo: Decodable, Equatable {
    let fret: Int
    public init(fret: Int) {
        self.fret = fret
    }
}

// > The staff-size element indicates how large a staff
// > space is on this staff, expressed as a percentage of
// > the work's default scaling. Values less than 100 make
// > the staff space smaller while values over 100 make the
// > staff space larger. A staff-type of cue, ossia, or
// > editorial implies a staff-size of less than 100, but
// > the exact value is implementation-dependent unless
// > specified here. Staff size affects staff height only,
// > not the relationship of the staff to the left and
// > right margins.
//
// <!ELEMENT staff-size (#PCDATA)>
public struct StaffSize: Decodable, Equatable {
    let value: Double
    public init(value: Double) {
        self.value = value
    }
}

// > A measure-style indicates a special way to print partial
// > to multiple measures within a part. This includes multiple
// > rests over several measures, repeats of beats, single, or
// > multiple measures, and use of slash notation.
//
// > The multiple-rest and measure-repeat symbols indicate the
// > number of measures covered in the element content. The
// > beat-repeat and slash elements can cover partial measures.
// > All but the multiple-rest element use a type attribute to
// > indicate starting and stopping the use of the style. The
// > optional number attribute specifies the staff number from
// > top to bottom on the system, as with clef.
//
// <!ELEMENT measure-style (multiple-rest |
//    measure-repeat | beat-repeat | slash)>
// <!ATTLIST measure-style
//    number CDATA #IMPLIED
//    %font;
//    %color;
//    %optional-unique-id;
// >
// TODO: (multiple-rest | measure-repeat | beat-repeat | slash)
public struct MeasureStyle: Decodable, Equatable {
    let number: Int
    let font: String
    let color: String
    let id: String?
    public init(number: Int, font: String, color: String, id: String?) {
        self.number = number
        self.font = font
        self.color = color
        self.id = id
    }
}

// > The slash-type and slash-dot elements are optional children
// > of the beat-repeat and slash elements. They have the same
// > values as the type and dot elements, and define what the
// > beat is for the display of repetition marks. If not present,
// > the beat is based on the current time signature.
//
// <!ELEMENT slash-type (#PCDATA)>
public struct SlashType {
    // TODO: Don't entirely understand this one yet.
}

// > The slash-type and slash-dot elements are optional children
// > of the beat-repeat and slash elements. They have the same
// > values as the type and dot elements, and define what the
// > beat is for the display of repetition marks. If not present,
// > the beat is based on the current time signature.
//
// <!ELEMENT slash-dot EMPTY>
public struct SlashDot {
    // TODO: Don't entirely understand this one yet.
}

// > The except-voice element is used to specify a combination
// > of slash notation and regular notation. Any note elements
// > that are in voices specified by the except-voice elements
// > are displayed in normal notation, in addition to the slash
// > notation that is always displayed.
//
// <!ELEMENT except-voice (#PCDATA)>
public struct ExceptVoice {
    // TODO: Don't entirely understand this one yet.
}

// > The text of the multiple-rest element indicates the number
// > of measures in the multiple rest. Multiple rests may use
// > the 1-bar / 2-bar / 4-bar rest symbols, or a single shape.
// > The use-symbols attribute indicates which to use; it is no
// > if not specified.
//
// <!ELEMENT multiple-rest (#PCDATA)>
// <!ATTLIST multiple-rest
//    use-symbols %yes-no; #IMPLIED
// >
public struct MultipleRest {
    let count: Int
    let useSymbols: Bool
    public init(count: Int, useSymbols: Bool) {
        self.count = count
        self.useSymbols = useSymbols
    }
}

// > The measure-repeat and beat-repeat element specify a
// > notation style for repetitions. The actual music being
// > repeated needs to be repeated within the MusicXML file.
// > These elements specify the notation that indicates the
// > repeat.

// > The measure-repeat element is used for both single and
// > multiple measure repeats. The text of the element indicates
// > the number of measures to be repeated in a single pattern.
// > The slashes attribute specifies the number of slashes to
// > use in the repeat sign. It is 1 if not specified. Both the
// > start and the stop of the measure-repeat must be specified.
//
// <!ELEMENT measure-repeat (#PCDATA)>
// <!ATTLIST measure-repeat
//    type %start-stop; #REQUIRED
//    slashes NMTOKEN #IMPLIED
// >
// TODO: Factor out enum `StartOrStop`
public struct MeasureRepeat {
    public enum Kind: String {
        case start
        case stop
    }
    let kind: Kind
    let slashes: Int
    public init(kind: Kind, slashes: Int) {
        self.kind = kind
        self.slashes = slashes
    }
}

// > The beat-repeat element is used to indicate that a single
// > beat (but possibly many notes) is repeated. Both the start
// > and stop of the beat being repeated should be specified.
// > The slashes attribute specifies the number of slashes to
// > use in the symbol. The use-dots attribute indicates whether
// > or not to use dots as well (for instance, with mixed rhythm
// > patterns). By default, the value for slashes is 1 and the
// > value for use-dots is no.
//
// <!ELEMENT beat-repeat ((slash-type, slash-dot*)?, except-voice*)>
// <!ATTLIST beat-repeat
//    type %start-stop; #REQUIRED
//    slashes NMTOKEN #IMPLIED
//    use-dots %yes-no; #IMPLIED
// >
// TODO: except-voice
// TODO: Factor out enum `StartOrStop`
public struct BeatRepeat {
    public enum Kind: String {
        case start
        case stop
    }
    let kind: Kind
    let slashes: Int
    let useDots: Bool
    public init(kind: Kind, slashes: Int, useDots: Bool) {
        self.kind = kind
        self.slashes = slashes
        self.useDots = useDots
    }
}

// > The slash element is used to indicate that slash notation
// > is to be used. If the slash is on every beat, use-stems is
// > no (the default). To indicate rhythms but not pitches,
// > use-stems is set to yes. The type attribute indicates
// > whether this is the start or stop of a slash notation
// > style. The use-dots attribute works as for the beat-repeat
// > element, and only has effect if use-stems is no.
//
// <!ELEMENT slash ((slash-type, slash-dot*)?, except-voice*)>
// <!ATTLIST slash
//    type %start-stop; #REQUIRED
//    use-dots %yes-no; #IMPLIED
//    use-stems %yes-no; #IMPLIED
// >
// TODO: except-voice
// TODO: Factor out enum `StartOrStop`
public struct Slash {
    public enum Kind: String {
        case start
        case stop
    }
    let kind: Kind
    let useDots: Bool
    let useStems: Bool
    public init(kind: Kind, useDots: Bool, useStems: Bool) {
        self.kind = kind
        self.useDots = useDots
        self.useStems = useStems
    }
}

// MARK: Deprecated (Version 2.0)
//
// > Directives are like directions, but can be grouped together
// > with attributes for convenience. This is typically used for
// > tempo markings at the beginning of a piece of music. This
// > element has been deprecated in Version 2.0 in favor of
// > the directive attribute for direction elements. Language
// > names come from ISO 639, with optional country subcodes
// > from ISO 3166.
//
// <!ELEMENT directive (#PCDATA)>
// <!ATTLIST directive
//    %print-style;
//    xml:lang NMTOKEN #IMPLIED
// >
//
// FIXME: The types (`String`) for `printStyle` and `language` are guesses at this point.
public struct Directive: Decodable, Equatable {
    let printStyle: String
    let language: String
    public init(printStyle: String, language: String) {
        self.printStyle = printStyle
        self.language = language
    }
}

extension Attributes: Decodable {

    // MARK: Decodable

    enum CodingKeys: String, CodingKey {
        case editorial
        case divisions
        case keys = "key"
        case time
        case staves
        case partSymbol = "part-symbol"
        case instruments
        case clefs = "clef"
        case staffDetails = "staff-details"
        case transpose
        case directive
        case measureStyles = "measure-style"
    }
}
