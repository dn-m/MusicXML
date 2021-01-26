//
//  Arrow.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

import XMLCoder

/// The arrow element represents an arrow used for a musical technical indication.
public struct Arrow {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let placement: AboveBelow?

    // MARK: Attribute Groups

    public let position: Position
    public let printStyle: PrintStyle

    // MARK: Kind

    public let kind: Kind

    // MARK: - Initializers

    public init(kind: Kind, position: Position = Position(), printStyle: PrintStyle = PrintStyle(), placement: AboveBelow? = nil) {
        self.kind = kind
        self.position = position
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension Arrow {
    /// Create a circular `Arrow`.
    public init(
        direction: CircularArrow,
        position: Position = Position(),
        printStyle: PrintStyle = PrintStyle(),
        placement: AboveBelow? = nil
    ) {
        self.kind = .circular(direction)
        self.position = position
        self.printStyle = printStyle
        self.placement = placement
    }

    /// Create a linear `Arrow`.
    public init(
        direction: ArrowDirection,
        style: ArrowStyle? = nil,
        position: Position = Position(),
        printStyle: PrintStyle = PrintStyle(),
        placement: AboveBelow? = nil
    ) {
        self.kind = .linear(LinearArrow(direction: direction, style: style))
        self.position = position
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension Arrow {
    // MARK: - Nested Types

    public enum Kind {
        case circular(CircularArrow)
        case linear(LinearArrow)
    }
}

extension Arrow.Kind: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case circular
        case linear
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .circular(value):
            try container.encode(value, forKey: .circular)
        case let .linear(value):
            try container.encode(value, forKey: .linear)
        }
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.circular) {
            self = .circular(try decode(.circular))
        } else if container.contains(.linear) {
            self = .linear(try decode(.linear))
        } else {
            throw DecodingError.typeMismatch(
                Arrow.Kind.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension Arrow.Kind.CodingKeys: XMLChoiceCodingKey {}

extension Arrow.Kind: Equatable {}
extension Arrow: Equatable {}
extension Arrow: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case kind
        case placement
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        kind = try container.decode(Kind.self, forKey: .kind)
        self.position = try Position(from: decoder)
        self.printStyle = try PrintStyle(from: decoder)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(kind, forKey: .kind)
        try position.encode(to: encoder)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(placement, forKey: .placement)
    }
}

extension Arrow: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.placement:
            return .attribute
        default:
            return .element
        }
    }
}
