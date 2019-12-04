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
    // MARK: - Instance Properties

    // MARK: Attributes

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

    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?
    public let printObject: Bool?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: Kind

    public let kind: Kind

    // MARK: - Initializers

    public init(number: Int? = nil, symbol: TimeSymbol? = nil, separator: TimeSeparator? = nil, printStyle: PrintStyle = PrintStyle(), hAlign: LeftCenterRight? = nil, vAlign: VAlign? = nil, printObject: Bool? = nil, kind: Kind) {
        self.number = number
        self.symbol = symbol
        self.separator = separator
        self.printStyle = printStyle
        self.hAlign = hAlign
        self.vAlign = vAlign
        self.printObject = printObject
        self.kind = kind
    }
}

extension Time {
    /// Creates a `Measured` type `Time`.
    ///
    /// **Example Usage:**
    ///
    ///     let _ = Time(4,4)
    ///     let _ = Time(3, 16, staff: 3)
    ///
    public init(
        _ beats: Int,
        _ beatType: Int,
        symbol: TimeSymbol? = nil,
        staff: Int? = nil,
        interchangeable: Interchangeable? = nil
    ) {
        self.number = staff
        self.symbol = symbol
        self.kind = .measured(
            Measured(
                signature: Time.Signature(beats: beats, beatType: beatType),
                interchangeable: interchangeable
            )
        )
        // TODO: Add remaining attributes and elements
        self.separator = nil
        self.printStyle = PrintStyle()
        self.hAlign = nil
        self.vAlign = nil
        self.printObject = nil
    }

    /// Creates an `Unmeasured` type `Time`.
    ///
    /// **Example Usage:**
    ///
    ///     let _ = Time(symbol: "XXX")
    ///
    public init(symbol: String? = nil, staff: Int? = nil) {
        self.number = staff
        self.kind = .unmeasured(Unmeasured(symbol: symbol))
        // TODO: Add remaining attributes and elements
        // TODO: correct symbol
        self.symbol = nil
        self.separator = nil
        self.printStyle = PrintStyle()
        self.hAlign = nil
        self.vAlign = nil
        self.printObject = nil
    }
}

extension Time {
    public struct Signature {
        // MARK: - Instance Properties

        let beats: Int
        let beatType: Int

        public init(beats: Int, beatType: Int) {
            self.beats = beats
            self.beatType = beatType
        }
    }

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
        // MARK: - Instance Properties

        // FIXME: Handle multiple time signatures in Time.Measured
        var signature: Signature
        var interchangeable: Interchangeable?

        public init(signature: Signature, interchangeable: Interchangeable? = nil) {
            self.signature = signature
            self.interchangeable = interchangeable
        }
    }

    // > A senza-misura element explicitly indicates that no time
    // > signature is present. The optional element content
    // > indicates the symbol to be used, if any, such as an X.
    // > The time element's symbol attribute is not used when a
    // > senza-misura element is present.
    public struct Unmeasured {
        // MARK: - Instance Properties

        let symbol: String?

        public init(symbol: String? = nil) {
            self.symbol = symbol
        }
    }

    public enum Kind {
        case measured(Measured)
        case unmeasured(Unmeasured)
    }
}

extension Time.Signature: Equatable {}
extension Time.Signature: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case beats
        case beatType = "beat-type"
    }
}

extension Time.Measured: Equatable {}
extension Time.Measured: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case signature
        case interchangeable
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let signatureContainer = try decoder.container(keyedBy: Time.Signature.CodingKeys.self)
        self.signature = Time.Signature(
            beats: try signatureContainer.decode(Int.self, forKey: .beats),
            beatType: try signatureContainer.decode(Int.self, forKey: .beatType)
        )
        let container = try decoder.container(keyedBy: Time.Measured.CodingKeys.self)
        self.interchangeable = try container.decodeIfPresent(Interchangeable.self, forKey: .interchangeable)
    }
}

extension Time.Unmeasured: Equatable {}
extension Time.Unmeasured: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case symbol
    }
}

extension Time.Kind: Equatable {}
extension Time.Kind: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case measured
        case unmeasured
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .measured(value):
            try container.encode(value, forKey: .measured)
        case let .unmeasured(value):
            try container.encode(value, forKey: .unmeasured)
        }
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .measured(try container.decode(Time.Measured.self, forKey: .measured))
        } catch {
            self = .unmeasured(try container.decode(Time.Unmeasured.self, forKey: .unmeasured))
        }
    }
}

extension Time: Equatable {}
extension Time: Codable {
    // MARK: - Codable

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        // Decode attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.symbol = try container.decodeIfPresent(TimeSymbol.self, forKey: .symbol)
        self.separator = try container.decodeIfPresent(TimeSeparator.self, forKey: .separator)
        self.printStyle = try PrintStyle(from: decoder)
        self.hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
        self.vAlign = try container.decodeIfPresent(VAlign.self, forKey: .vAlign)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        // Decode kind
        do {
            // FIXME: Audit containers in Time.init(from: Decoder)
            let kindContainer = try decoder.container(keyedBy: Measured.CodingKeys.self)
            let signatureContainer = try decoder.container(keyedBy: Signature.CodingKeys.self)
            self.kind = .measured(
                Time.Measured(
                    signature: Signature(
                        beats: try signatureContainer.decode(Int.self, forKey: .beats),
                        beatType: try signatureContainer.decode(Int.self, forKey: .beatType)
                    ),
                    interchangeable: try kindContainer.decodeIfPresent(Interchangeable.self,
                                                                       forKey: .interchangeable)
                )
            )
        } catch {
            let kindContainer = try decoder.container(keyedBy: Unmeasured.CodingKeys.self)
            self.kind = .unmeasured(
                Time.Unmeasured(
                    symbol: try kindContainer.decodeIfPresent(String.self, forKey: .symbol)
                )
            )
        }
    }
}

extension Time: DynamicNodeDecoding {
    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        switch key {
        case CodingKeys.symbol, CodingKeys.number:
            return .attribute
        default:
            return .element
        }
    }
}
