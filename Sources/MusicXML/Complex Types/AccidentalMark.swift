//
//  AccidentalMark.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// An accidental-mark can be used as a separate notation or as part of an ornament. When used in an
/// ornament, position and placement are relative to the ornament, not relative to the note.
public struct AccidentalMark {
    // MARK: - Instance Properties

    // MARK: Value

    public var value: AccidentalValue

    // MARK: Attributes

    public var placement: AboveBelow?
    public var position: Position
    public var printStyle: PrintStyle

    // MARK - Initializers

    public init(_ value: AccidentalValue, placement: AboveBelow? = nil, position: Position = Position(), printStyle: PrintStyle = PrintStyle()) {
        self.value = value
        self.placement = placement
        self.position = position
        self.printStyle = printStyle
    }
}

extension AccidentalMark: Equatable {}
extension AccidentalMark: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case position
        case placement
        case printStyle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(AccidentalValue.self, forKey: .value)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        self.position = try Position(from: decoder)
        self.printStyle = try PrintStyle(from: decoder)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encodeIfPresent(placement, forKey: .placement)
        try position.encode(to: encoder)
        try printStyle.encode(to: encoder)
    }
}

import XMLCoder
extension AccidentalMark: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
