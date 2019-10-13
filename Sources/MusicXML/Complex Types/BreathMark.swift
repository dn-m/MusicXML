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
    public let position: Position
    public let printStyle: PrintStyle

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

extension BreathMark: Equatable { }
extension BreathMark: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case placement
    }
    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.position = try Position(from: decoder)
        self.printStyle = try PrintStyle(from: decoder)
        // Decode one-off attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        // Decode value
        self.value = try container.decodeIfPresent(BreathMarkValue.self, forKey: .value) ?? .comma
    }
}
