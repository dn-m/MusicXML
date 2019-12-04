//
//  BreathMark.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The breath-mark element indicates a place to take a breath.
public struct BreathMark {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: BreathMarkValue

    // MARK: Attributes

    public let placement: AboveBelow?

    // MARK: Attribute Groups

    public let position: Position
    public let printStyle: PrintStyle

    // MARK: - Initializers

    public init(
        _ value: BreathMarkValue = .comma,
        placement: AboveBelow? = nil,
        position: Position = Position(),
        printStyle: PrintStyle = PrintStyle()
    ) {
        self.value = value
        self.placement = placement
        self.position = position
        self.printStyle = printStyle
    }
}

extension BreathMark: Equatable {}
extension BreathMark: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case value = ""
        case placement
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.position = try Position(from: decoder)
        self.printStyle = try PrintStyle(from: decoder)
        // Decode one-off attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        // Decode value
        let breathMarkValue = try container.decode(BreathMarkValue.self, forKey: .value)
        self.value = breathMarkValue == .default ? .comma : breathMarkValue
    }
}

import XMLCoder
extension BreathMark: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
