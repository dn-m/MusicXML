//
//  MeasureStyle.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

import XMLCoder

/// A measure-style indicates a special way to print partial to multiple measures within a part.
/// This includes multiple rests over several measures, repeats of beats, single, or multiple
/// measures, and use of slash notation. The multiple-rest and measure-repeat symbols indicate the
/// number of measures covered in the element content. The beat-repeat and slash elements can cover
/// partial measures. All but the multiple-rest element use a type attribute to indicate starting
/// and stopping the use of the style.
public struct MeasureStyle {
    // MARK: - Instance Properties

    // MARK: Attributes

    public var number: Int?
    public var color: Color?

    // MARK: Attribute Groups

    public var font: Font

    // MARK: Kind

    public var kind: Kind

    // MARK: - Initializers

    public init(number: Int? = nil, font: Font = Font(), color: Color? = nil, kind: Kind) {
        self.number = number
        self.font = font
        self.color = color
        self.kind = kind
    }
}

extension MeasureStyle {
    public enum Kind {
        case beatRepeat(BeatRepeat)
        case measureRepeat(MeasureRepeat)
        case multipleRest(MultipleRest)
        case slash(Slash)
    }
}

extension MeasureStyle.Kind: Equatable {}
extension MeasureStyle.Kind: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case beatRepeat = "beat-repeat"
        case measureRepeat = "measure-repeat"
        case multipleRest = "multiple-rest"
        case slash
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .beatRepeat(value):
            try container.encode(value, forKey: .beatRepeat)
        case let .measureRepeat(value):
            try container.encode(value, forKey: .measureRepeat)
        case let .multipleRest(value):
            try container.encode(value, forKey: .multipleRest)
        case let .slash(value):
            try container.encode(value, forKey: .slash)
        }
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.beatRepeat) {
            self = .beatRepeat(try container.decode(BeatRepeat.self, forKey: .beatRepeat))
        } else if container.contains(.measureRepeat) {
            self = .measureRepeat(try container.decode(MeasureRepeat.self, forKey: .measureRepeat))
        } else if container.contains(.multipleRest) {
            self = .multipleRest(try container.decode(MultipleRest.self, forKey: .multipleRest))
        } else if container.contains(.slash) {
            self = .slash(try container.decode(Slash.self, forKey: .slash))
        } else {
            throw DecodingError.typeMismatch(
                MeasureStyle.Kind.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized MeasureStyle.Kind"
                )
            )
        }
    }
}

extension MeasureStyle.Kind.CodingKeys: XMLChoiceCodingKey {}

extension MeasureStyle: Equatable {}
extension MeasureStyle: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case number
        case color
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        font = try Font(from: decoder)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
        kind = try Kind(from: decoder)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(number, forKey: .number)
        try font.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
        try kind.encode(to: encoder)
    }
}

extension MeasureStyle: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number, CodingKeys.color:
            return .attribute
        default:
            return .element
        }
    }
}
