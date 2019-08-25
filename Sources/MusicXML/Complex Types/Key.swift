//
//  Key.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

import XMLCoder

/// The key type represents a key signature. Both traditional and non-traditional key signatures are
/// supported. If absent, the key signature applies to all staves in the part. Key signatures appear
/// at the start of each system unless the print-object attribute has been set to "no".
public struct Key {

    // MARK: - Attributes

    /// The optional number attribute refers to staff numbers.
    public var number: Int?
    public var position: Position?
    public var printStyle: PrintStyle?
    public var printObject: Bool?

    // MARK: - Elements

    public var kind: Kind
    public var keyOctave: [KeyOctave]?
}

extension Key {

    // MARK: - Initializers

    /// Creates a `Traditional` type `Key`.
    public init(fifths: Int, cancel: Cancel? = nil, mode: Mode? = nil, staff: Int? = nil) {
        self.number = staff
        self.kind = .traditional(Traditional(cancel: cancel, fifths: fifths, mode: mode))
        // TODO: Add remaining attributes and elements
    }

    /// Creates a `NonTraditional` type `Key`.
    public init(step: Step, alter: Double, accidental: AccidentalValue) {
        self.kind = .nonTraditional(
            NonTraditional(step: step, alter: alter, accidental: accidental)
        )
        // TODO: Add remaining attributes and elements
    }
}

extension Key {

    public struct Traditional {
        public var cancel: Cancel?
        public var fifths: Int
        public var mode: Mode?
    }

    /// Non-traditional key signatures can be represented using the Humdrum/Scot concept of a list
    /// of altered tones. The key-step element indicates the pitch step to be altered, represented
    /// using the same names as in the step element.
    public struct NonTraditional {
        public var step: Step
        public var alter: Double
        public var accidental: AccidentalValue
    }

    public enum Kind {
        case traditional(Traditional)
        case nonTraditional(NonTraditional)
    }
}

extension Key.NonTraditional: Equatable { }
extension Key.NonTraditional: Codable {
    enum CodingKeys: String, CodingKey {
        case step
        case alter
        case accidental
    }
}

extension Key.Traditional: Equatable { }
extension Key.Traditional: Codable {
    enum CodingKeys: String, CodingKey {
        case cancel
        case fifths
        case mode
    }
}

extension Key.Kind: Equatable { }
extension Key.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case traditional
        case nonTraditional
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .traditional(value):
            try container.encode(value, forKey: .traditional)
        case let .nonTraditional(value):
            try container.encode(value, forKey: .nonTraditional)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .traditional(try container.decode(Key.Traditional.self, forKey: .traditional))
        } catch {
            self = .nonTraditional(try container.decode(Key.NonTraditional.self, forKey: .nonTraditional))
        }
    }
}

extension Key: Equatable { }
extension Key: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Decode attributes
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.position = try container.decodeIfPresent(Position.self, forKey: .position)
        self.printStyle = try container.decodeIfPresent(PrintStyle.self, forKey: .printStyle)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        // Decode Elements
        self.keyOctave = try container.decodeIfPresent([KeyOctave].self, forKey: .keyOctave)
        // Decode Kind
        do {
            let kindContainer = try decoder.container(keyedBy: Key.Traditional.CodingKeys.self)
            self.kind = .traditional(
                Traditional(
                    cancel: try kindContainer.decodeIfPresent(Cancel.self, forKey: .cancel),
                    fifths: try kindContainer.decode(Int.self, forKey: .fifths),
                    mode: try kindContainer.decodeIfPresent(Mode.self, forKey: .mode)
                )
            )
        } catch {
            let kindContainer = try decoder.container(keyedBy: NonTraditional.CodingKeys.self)
            self.kind = .nonTraditional(
                NonTraditional(
                    step: try kindContainer.decode(Step.self, forKey: .step),
                    alter: try kindContainer.decode(Double.self, forKey: .alter),
                    accidental: try kindContainer.decode(AccidentalValue.self, forKey: .accidental)
                )
            )
        }
    }
    #warning("TODO: Implement Key.encode(to: Encoder)")
}

#warning("Add all attribute grouped attributes")
extension Key: DynamicNodeDecoding {
    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        switch key {
        case CodingKeys.number:
            return .attribute
        default:
            return .element
        }
    }
}

extension Key: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.number:
            return .attribute
        default:
            return .element
        }
    }
}
