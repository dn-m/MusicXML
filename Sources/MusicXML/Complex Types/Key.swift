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
    public let position: Position
    public let printStyle: PrintStyle?
    public let printObject: Bool?

    // MARK: - Elements

    public let kind: Kind
    public let keyOctaves: [KeyOctave]

    public init(number: Int? = nil, position: Position = Position(), printStyle: PrintStyle? = nil, printObject: Bool? = nil, kind: Kind, keyOctaves: [KeyOctave] = []) {
        self.number = number
        self.position = position
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

        self.position = Position()
        self.printStyle = nil
        self.printObject = nil
        self.keyOctaves = []
    }

    /// Creates a `NonTraditional` type `Key`.
    public init(_ alteredTones: [AlteredTone]) {
        self.kind = .nonTraditional(alteredTones)
        // TODO: Add remaining attributes and elements
        self.number = nil
        self.position = Position()
        self.printStyle = nil
        self.printObject = nil
        self.keyOctaves = []
    }
}

extension Key {

    public struct Traditional {
        public var cancel: Cancel?
        public var fifths: Int
        public var mode: Mode?

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
        public var step: Step
        public var alter: Double
        public var accidental: AccidentalValue?

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

extension Key.AlteredTone: Equatable { }

extension Key.Traditional: Equatable { }
extension Key.Traditional: Codable { }

extension Key.Kind: Equatable { }

extension Key: Equatable { }
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
        self.position = try Position(from: decoder)
        self.printStyle = try container.decodeIfPresent(PrintStyle.self, forKey: .printStyle)
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
            // FIXME: This is not technically correct. The `<key-accidental>` values are optional.
            // Here, we assume there is a `<key-accidental>` for each `<key-step>` and `<key-alter>`
            // pair. Otherwise, we shove any `<key-accidental>` to the earliest pair. This may not
            // be the case in real life.
            let steps = try container.decode([Step].self, forKey: .keyStep)
            let alters = try container.decode([Double].self, forKey: .keyAlter)
            let accidentals = try container.decode([AccidentalValue].self, forKey: .keyAccidental)
            let alteredTones: [AlteredTone] = zip(steps,alters)
                .enumerated()
                .map { index, stepAndAlter in
                    let (step,alter) = stepAndAlter
                    return AlteredTone(
                        step: step,
                        alter: alter,
                        accidental: index < accidentals.count ? accidentals[index] : nil
                    )
                }
            self.kind = .nonTraditional(alteredTones)
        }
    }

    public func encode(to encoder: Encoder) throws {
        fatalError("TODO: Implement Key.encode(to: Encoder)")
    }
}
