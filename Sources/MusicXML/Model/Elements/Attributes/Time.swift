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
                let symbol: TimeSymbol
                let separator: TimeSeparator
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
    let symbol: TimeSymbol
    let separator: TimeSeparator

    // The optional number attribute refers to staff
    // > numbers within the part, from top to bottom on the system.
    // > If absent, the time signature applies to all staves in the
    // > part.
    let id: Int?

    // MARK: - Initializers

    public init(kind: Kind, symbol: TimeSymbol, separator: TimeSeparator, id: Int?) {
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
