//
//  Key.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

// > If the cancel attribute is
// > set to yes, then this number refers to the canceling key
// > signature specified by the cancel element in the parent key
// > element. The cancel attribute cannot be set to yes if there is
// > no corresponding cancel element within the parent key element.
// > It is no by default.
// > Key signatures appear at the start of each system unless
// > the print-object attribute has been set to "no".
//
// > <!ELEMENT key (((cancel?, fifths, mode?) |
// >     ((key-step, key-alter, key-accidental?)*)), key-octave*)>
// > <!ATTLIST key
// >     number CDATA #IMPLIED
// >     %print-style;
// >     %print-object;
// >     %optional-unique-id;
// > >
// > <!ELEMENT fifths (#PCDATA)>
// > <!ELEMENT mode (#PCDATA)>
// > <!ELEMENT key-step (#PCDATA)>
// > <!ELEMENT key-alter (#PCDATA)>
// > <!ELEMENT key-accidental (#PCDATA)>
// > <!ATTLIST key-accidental
// >     %smufl;
// > >
public struct Key: Decodable, Equatable {

    // > <!ELEMENT key-octave (#PCDATA)>
    // > <!ATTLIST key-octave
    // >     number NMTOKEN #REQUIRED
    // >     cancel %yes-no; #IMPLIED
    // > >
    public struct Octave: Decodable, Equatable {
        let number: Int
        let cancel: Bool
    }

    public enum Kind: Decodable, Equatable {

        // > Traditional key signatures are represented by the number
        // > of flats and sharps, plus an optional mode for major/
        // > minor/mode distinctions.
        public struct Traditional: Decodable, Equatable {



            // > Negative numbers are used for
            // > flats and positive numbers for sharps, reflecting the
            // > key's placement within the circle of fifths (hence the
            // > element name).
            let fifths: Int
            let cancel: CancelLocation?
            let mode: Mode?

            public init(fifths: Int, cancel: CancelLocation?, mode: Mode?) {
                self.fifths = fifths
                self.cancel = cancel
                self.mode = mode
            }
        }

        // > Non-traditional key signatures can be represented using
        // > the Humdrum/Scot concept of a list of altered tones.
        // > The key-step and key-alter elements are represented the
        // > same way as the step and alter elements are in the pitch
        // > element in the note.mod file. The optional key-accidental
        // > element is represented the same way as the accidental
        // > element in the note.mod file. It is used for disambiguating
        // > microtonal accidentals. The different element names
        // > indicate the different meaning of altering notes in a scale
        // > versus altering a sounding pitch.
        public struct NonTraditional: Decodable, Equatable {
            let step: Int
            let alter: Double
            let accidental: String
        }

        case traditional(Traditional)
        case nonTraditional(NonTraditional)

        public init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            do {
                self = .traditional(try container.decode(Traditional.self))
            } catch {
                self = .nonTraditional(try container.decode(NonTraditional.self))
            }
        }
    }

    let kind: Kind

    // > The optional number attribute refers to staff numbers,
    // > from top to bottom on the system. If absent, the key
    // > signature applies to all staves in the part.
    let number: Int?

    // > The optional list of key-octave elements is used to specify
    // > in which octave each element of the key signature appears.
    // > The content specifies the octave value using the same
    // > values as the display-octave element. The number attribute
    // > is a positive integer that refers to the key signature
    // > element in left-to-right order.
    let octaves: [Octave]?

    let id: String?

    /// Creates a `Key` with the given `kind`, `number`, and `keyO
    public init(kind: Kind, number: Int?, octaves: [Octave]?, id: String?) {
        self.kind = kind
        self.number = number
        self.octaves = octaves
        self.id = id
    }

    #warning("TODO: Handle Key attributes number, octaves, id, etc.")
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.kind = try container.decode(Kind.self)
        self.number = nil
        self.octaves = nil
        self.id = nil
    }
}
