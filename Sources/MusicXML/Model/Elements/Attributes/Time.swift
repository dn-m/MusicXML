//
//  Time.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

// > The print-object attribute allows a time signature to be
// > specified but not printed, as is the case for excerpts
// > from the middle of a score. The value is "yes" if
// > not present.
//
// <!ELEMENT time
//     (((beats, beat-type)+, interchangeable?) | senza-misura)>
// <!ATTLIST time
//     number CDATA #IMPLIED
//     %time-symbol;
//     %time-separator;
//     %print-style-align;
//     %print-object;
//     %optional-unique-id;
// >
// <!ELEMENT interchangeable (time-relation?, (beats, beat-type)+)>
// <!ATTLIST interchangeable
//     %time-symbol;
//     %time-separator;
// >
// <!ELEMENT beats (#PCDATA)>
// <!ELEMENT beat-type (#PCDATA)>
// <!ELEMENT senza-misura (#PCDATA)>
// <!ELEMENT time-relation (#PCDATA)>
public struct Time: Equatable {

    // > The time-separator entity indicates how to display the
    // > arrangement between the beats and beat-type values in a
    // > time signature. The default value is none. The horizontal,
    // > diagonal, and vertical values represent horizontal, diagonal
    // > lower-left to upper-right, and vertical lines respectively.
    // > For these values, the beats and beat-type values are arranged
    // > on either side of the separator line. The none value represents
    // > no separator with the beats and beat-type arranged vertically.
    // > The adjacent value represents no separator with the beats and
    // > beat-type arranged horizontally.
    //
    // <!ENTITY % time-separator
    //    "separator (none | horizontal | diagonal |
    //        vertical | adjacent) #IMPLIED">
    public enum Separator: String, Decodable {
        case none
        case horizontal
        case diagonal
        case vertical
        case adjacent
    }

    // > The time-symbol entity indicates how to display a time
    // > signature. The normal value is the usual fractional display,
    // > and is the implied symbol type if none is specified. Other
    // > options are the common and cut time symbols, as well as a
    // > single number with an implied denominator. The note symbol
    // > indicates that the beat-type should be represented with
    // > the corresponding downstem note rather than a number. The
    // > dotted-note symbol indicates that the beat-type should be
    // > represented with a dotted downstem note that corresponds to
    // > three times the beat-type value, and a numerator that is
    // > one third the beats value.
    //
    // <!ENTITY % time-symbol
    //    "symbol (common | cut | single-number |
    //             note | dotted-note | normal) #IMPLIED">
    public enum Symbol: String, Decodable {
        case common = "common"
        case cut = "cut"
        case singleNumber = "single-number"
        case note = "note"
        case dottedNote = "dotted-note"
        case normal = "normal"
    }

    // > The time-relation element indicates the symbol used to
    // > represent the interchangeable aspect of the time signature.
    //
    // > Valid values are parentheses, bracket, equals, slash, space,
    // > and hyphen.
    public enum Relation: String, Decodable {
        case parentheses
        case bracket
        case equals
        case slash
        case space
        case hyphen
    }

    public enum Kind: Equatable {

        // > Time signatures are represented by two elements. The
        // > beats element indicates the number of beats, as found in
        // > the numerator of a time signature. The beat-type element
        // > indicates the beat unit, as found in the denominator of
        // > a time signature.
        //
        // > Multiple pairs of beats and beat-type elements are used for
        // > composite time signatures with multiple denominators, such
        // > as 2/4 + 3/8. A composite such as 3+2/8 requires only one
        // > beats/beat-type pair.
        //
        // > The interchangeable element is used to represent the second
        // > in a pair of interchangeable dual time signatures, such as
        // > the 6/8 in 3/4 (6/8). A separate symbol attribute value is
        // > available compared to the time element's symbol attribute,
        // > which applies to the first of the dual time signatures.
        public struct Measured: Equatable {
            public struct Interchangeable: Decodable, Equatable {
                let symbol: Symbol
                let separator: Separator
            }
            public struct Signature: Equatable {
                let beats: Int
                let beatType: Int
            }
            let signatures: [Signature] // TODO: Ensure NonEmpty
            let interchangeable: Interchangeable?
        }

        // > A senza-misura element explicitly indicates that no time
        // > signature is present. The optional element content
        // > indicates the symbol to be used, if any, such as an X.
        // > The time element's symbol attribute is not used when a
        // > senza-misura element is present.
        public struct Unmeasured: Equatable {
            let symbol: String?
        }

        case measured(Measured)
        case unmeasured(Unmeasured)
    }

    let kind: Kind
    let symbol: Symbol
    let separator: Separator

    // The optional number attribute refers to staff
    // > numbers within the part, from top to bottom on the system.
    // > If absent, the time signature applies to all staves in the
    // > part.
    let id: Int?

    // MARK: - Initializers

    public init(kind: Kind, symbol: Symbol, separator: Separator, id: Int?) {
        self.kind = kind
        self.symbol = symbol
        self.separator = separator
        self.id = id
    }
}

extension Time: Decodable {

    // MARK: - Decodable

    #warning("TODO: Handle Time attributes symbol, separator, id, etc.")
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.kind = try container.decode(Kind.self)
        self.symbol = .common
        self.separator = .horizontal
        self.id = nil
    }
}

extension Time.Kind: Decodable {

    // MARK: - Decodable

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        do {
            self = .measured(try container.decode(Measured.self))
        } catch {
            self = .unmeasured(try container.decode(Unmeasured.self))
        }
    }
}

extension Time.Kind.Measured: Decodable {

    // MARK: - Decodable

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.signatures = try container.decode([Signature].self)
        self.interchangeable = nil
    }
}

extension Time.Kind.Unmeasured: Decodable { }

extension Time.Kind.Measured.Signature: Decodable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case beats
        case beatType = "beat-type"
    }
}
