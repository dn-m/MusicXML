//
//  Time.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

import XMLCoder

/// Time signatures are represented by the beats element for the numerator and the beat-type element
/// for the denominator. Multiple pairs of beat and beat-type elements are used for composite time
/// signatures with multiple denominators, such as 2/4 + 3/8. A composite such as 3+2/8 requires
/// only one beat/beat-type pair. The print-object attribute allows a time signature to be specified
/// but not printed, as is the case for excerpts from the middle of a score. The value is "yes" if
/// not present.
public struct Time {

    // MARK: - Attributes

    /// The optional number attribute refers to staff numbers within the part. If absent, the
    /// time signature applies to all staves in the part.
    public let number: Int?

    /// The symbol attribute is used indicate common and cut time symbols as well as a single number
    /// display.
    public let symbol: TimeSymbol?

    /// The time-separator attribute indicates how to display the arrangement between the beats and
    /// beat-type values in a time signature. The default value is none. The horizontal, diagonal,
    /// and vertical values represent horizontal, diagonal lower-left to upper-right, and vertical
    /// lines respectively. For these values, the beats and beat-type values are arranged on either
    /// side of the separator line. The none value represents  no separator with the beats and
    /// beat-type arranged vertically. The adjacent value represents no separator with the beats and
    /// beat-type arranged horizontally.
    public let separator: TimeSeparator?

    public let printStyle: PrintStyle?
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?
    public let printObject: Bool?

    // MARK: - Elements
    public let kind: Kind
}

extension Time {

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
    public struct Measured {

        public struct Signature: Equatable, Codable {
            let beats: Int
            let beatType: Int
        }
        let signatures: [Signature]
        let interchangeable: Interchangeable?
    }

    // > A senza-misura element explicitly indicates that no time
    // > signature is present. The optional element content
    // > indicates the symbol to be used, if any, such as an X.
    // > The time element's symbol attribute is not used when a
    // > senza-misura element is present.
    public struct Unmeasured {
        let symbol: String?
    }

    public enum Kind {
        case measured(Measured)
        case unmeasured(Unmeasured)
    }
}

extension Time.Measured: Equatable { }
extension Time.Measured: Codable { }

extension Time.Unmeasured: Equatable { }
extension Time.Unmeasured: Codable { }

extension Time.Kind: Equatable { }
extension Time.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case measured
        case unmeasured
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .measured(value):
            try container.encode(value, forKey: .measured)
        case let .unmeasured(value):
            try container.encode(value, forKey: .unmeasured)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .measured(try container.decode(Time.Measured.self, forKey: .measured))
        } catch {
            self = .unmeasured(try container.decode(Time.Unmeasured.self, forKey: .unmeasured))
        }
    }
}

extension Time: Equatable { }
extension Time: Codable {
    public init(from decoder: Decoder) throws {
        //let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = nil
        self.symbol = nil
        self.separator = nil
        self.printStyle = nil
        self.hAlign = nil
        self.vAlign = nil
        self.printObject = nil
        self.kind = .measured(
            Time.Measured(
                signatures: [Time.Measured.Signature(beats: 4, beatType: 4)],
                interchangeable: nil
            )
        )
    }
}
