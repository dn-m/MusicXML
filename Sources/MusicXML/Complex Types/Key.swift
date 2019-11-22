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
    public let number: Int?
    public let printStyle: PrintStyle
    public let printObject: Bool?

    // MARK: - Elements

    public let kind: Kind
    public let keyOctaves: [KeyOctave]

    public init(number: Int? = nil, printStyle: PrintStyle = PrintStyle(), printObject: Bool? = nil, kind: Kind, keyOctaves: [KeyOctave] = []) {
        self.number = number
        self.printStyle = printStyle
        self.printObject = printObject
        self.kind = kind
        self.keyOctaves = keyOctaves
    }
}

extension Key {
    // MARK: - Initializers

    /// Creates a `Traditional` type `Key`.
    public init(fifths: Int, cancel: Cancel? = nil, mode: Mode? = nil, staff: Int? = nil) {
        self.number = staff
        self.kind = .traditional(Traditional(cancel: cancel, fifths: fifths, mode: mode))
        // TODO: Add remaining attributes and elements

        self.printStyle = PrintStyle()
        self.printObject = nil
        self.keyOctaves = []
    }

    /// Creates a `NonTraditional` type `Key`.
    public init(_ alteredTones: [AlteredTone]) {
        self.kind = .nonTraditional(alteredTones)
        // TODO: Add remaining attributes and elements
        self.number = nil
        self.printStyle = PrintStyle()
        self.printObject = nil
        self.keyOctaves = []
    }
}

extension Key {
    public struct Traditional {
        public let cancel: Cancel?
        public let fifths: Int
        public let mode: Mode?

        public init(cancel: Cancel? = nil, fifths: Int, mode: Mode? = nil) {
            self.cancel = cancel
            self.fifths = fifths
            self.mode = mode
        }
    }

    /// Non-traditional key signatures can be represented using the Humdrum/Scot concept of a list
    /// of altered tones. The key-step element indicates the pitch step to be altered, represented
    /// using the same names as in the step element.
    public struct AlteredTone {
        public let step: Step
        public let alter: Double
        public let accidental: AccidentalValue?

        public init(step: Step, alter: Double, accidental: AccidentalValue? = nil) {
            self.step = step
            self.alter = alter
            self.accidental = accidental
        }
    }

    public enum Kind {
        case traditional(Traditional)
        case nonTraditional([AlteredTone])
    }
}

extension Key.AlteredTone: Equatable {}

extension Key.Traditional: Equatable {}
extension Key.Traditional: Codable {}

extension Key.Kind: Equatable {}
extension Key.Kind: Encodable {
    public func encode(to encoder: Encoder) throws {
        switch self {
        case let .traditional(key):
            try key.encode(to: encoder)
        case let .nonTraditional(alteredTones):
            var container = encoder.container(keyedBy: Key.CodingKeys.self)
            try alteredTones.forEach {
                try container.encode($0.step, forKey: .keyStep)
                try container.encode($0.alter, forKey: .keyAlter)
                try container.encodeIfPresent($0.accidental, forKey: .keyAccidental)
            }
        }
    }
}

extension Key: Equatable {}
extension Key: Codable {
    enum CodingKeys: String, CodingKey {
        case number
        case position
        case printStyle
        case printObject
        case kind
        case keyOctaves = "key-octave"
        case keyStep = "key-step"
        case keyAlter = "key-alter"
        case keyAccidental = "key-accidental"
        case cancel
        case fifths
        case mode
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Decode attributes
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.printStyle = try PrintStyle(from: decoder)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)

        // Decode Elements
        self.keyOctaves = try container.decode([KeyOctave].self, forKey: .keyOctaves)

        do {
            // Attempt to decode traditional `Key`
            self.kind = .traditional(
                Traditional(
                    cancel: try container.decodeIfPresent(Cancel.self, forKey: .cancel),
                    fifths: try container.decode(Int.self, forKey: .fifths),
                    mode: try container.decodeIfPresent(Mode.self, forKey: .mode)
                )
            )
        } catch {
            // Attempt to decode non-traditional `Key`.
            var alteredTones = [AlteredTone]()
            let components: [KeyComponent] = try decoder.collectArray()
            var previousStep: Step?
            var previousAlter: Double?
            for component in components {
                switch component {
                case let .keyStep(step):
                    if let unwrappedStep = previousStep {
                        if let alter = previousAlter {
                            alteredTones.append(AlteredTone(step: unwrappedStep, alter: alter))
                            previousStep = step
                            previousAlter = nil
                        } else {
                            // The previous value was also a key-step
                            throw DecodingError.typeMismatch(
                                Key.self,
                                DecodingError.Context(
                                    codingPath: decoder.codingPath,
                                    debugDescription: "Two key-step values in a row in non-traditional key"
                                )
                            )
                        }
                    } else {
                        previousStep = step
                    }
                case let .keyAlter(alter):
                    if previousStep != nil {
                        previousAlter = alter
                    } else {
                        // The preceding value was not a key-step
                        throw DecodingError.typeMismatch(
                            Key.self,
                            DecodingError.Context(
                                codingPath: decoder.codingPath,
                                debugDescription: "key-alter value not preceded by key-step value in non-traditional key"
                            )
                        )
                    }
                case let .keyAccidental(accidental):
                    if let step = previousStep, let alter = previousAlter {
                        alteredTones.append(AlteredTone(step: step, alter: alter, accidental: accidental))
                        // Reset
                        previousStep = nil
                        previousAlter = nil
                    } else {
                        // This accidental was not preceded by a key-step and a key-alter
                        throw DecodingError.typeMismatch(
                            Key.self,
                            DecodingError.Context(
                                codingPath: decoder.codingPath,
                                debugDescription: "key-accidental not preceded by key-step and key-alter in non-traditional key"
                            )
                        )
                    }
                }
            }
            if let step = previousStep, let alter = previousAlter {
                alteredTones.append(AlteredTone(step: step, alter: alter))
                previousStep = nil
                previousAlter = nil
            }
            guard previousStep == nil, previousAlter == nil else {
                // Should not have leftover previous step or previous alter
                throw DecodingError.typeMismatch(
                    Key.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Whole number of altered tones not represented in non-traditional key"
                    )
                )
            }
            self.kind = .nonTraditional(alteredTones)
        }
    }

    public func encode(to encoder: Encoder) throws {
        try printStyle.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(YesNo(printObject), forKey: .printObject)
        try kind.encode(to: encoder)
        try container.encode(keyOctaves, forKey: .keyOctaves)
    }
}

enum KeyComponent: Decodable {
    enum CodingKeys: String, CodingKey {
        case keyStep = "key-step"
        case keyAlter = "key-alter"
        case keyAccidental = "key-accidental"
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.keyStep) {
            self = .keyStep(try decode(.keyStep))
        } else if container.contains(.keyAlter) {
            self = .keyAlter(try decode(.keyAlter))
        } else if container.contains(.keyAccidental) {
            self = .keyAccidental(try decode(.keyAccidental))
        } else {
            throw DecodingError.typeMismatch(
                KeyComponent.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }

    case keyStep(Step)
    case keyAlter(Double)
    case keyAccidental(AccidentalValue)
}

extension KeyComponent.CodingKeys: XMLChoiceCodingKey {}
