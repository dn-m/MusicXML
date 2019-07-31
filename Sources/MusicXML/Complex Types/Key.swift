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
    /// The optional number attribute refers to staff numbers.
    public let number: Int
    public let position: Position
    public let printStyle: PrintStyle
    public let printObject: Bool
    public let kind: Kind
    public let keyOctave: [KeyOctave]
}

extension Key {

    public struct Traditional {
        public let cancel: Cancel?
        public let fifths: Int
        public let mode: Mode?
    }

    /// Non-traditional key signatures can be represented using the Humdrum/Scot concept of a list
    /// of altered tones. The key-step element indicates the pitch step to be altered, represented
    /// using the same names as in the step element.
    public struct NonTraditional: Codable, Equatable {
        public let step: Step
        public let alter: Double
        public let accidental: AccidentalValue
    }

    public enum Kind {
        case traditional(Traditional)
        case nonTraditional(NonTraditional)
    }
}

extension Key.Traditional: Equatable { }
extension Key.Traditional: Codable { }

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

extension Key.Kind.CodingKeys: XMLChoiceCodingKey { }

extension Key: Equatable { }
extension Key: Codable { }
