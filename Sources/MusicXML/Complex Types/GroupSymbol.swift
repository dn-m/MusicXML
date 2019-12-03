//
//  GroupSymbol.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

import XMLCoder

/// The group-symbol type indicates how the symbol for a group is indicated in the score.
public struct GroupSymbol {
    // MARK: - Instance Properties

    public var value: GroupSymbolValue
    public var position: Position
    public var color: Color?

    // MARK: - Initializers

    public init(_ value: GroupSymbolValue, position: Position = Position(), color: Color? = nil) {
        self.value = value
        self.position = position
        self.color = color
    }
}

extension GroupSymbol: Equatable {}
extension GroupSymbol: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case value = ""
        case color
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try position.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(GroupSymbolValue.self, forKey: .value)
        position = try Position(from: decoder)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}

import XMLCoder
extension GroupSymbol: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
