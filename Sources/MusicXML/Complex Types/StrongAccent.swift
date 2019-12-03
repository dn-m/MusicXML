//
//  StrongAccent.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The strong-accent type indicates a vertical accent mark.
public struct StrongAccent {
    // MARK: - Instance Properties

    /// The type attribute indicates if the point of the accent is down or up.
    public let type: UpDown?
    public let placement: AboveBelow?
    public let position: Position
    public let printStyle: PrintStyle

    // MARK - Initializers

    public init(
        type: UpDown? = nil,
        placement: AboveBelow? = nil,
        position: Position = Position(),
        printStyle: PrintStyle = PrintStyle()
    ) {
        self.type = type
        self.placement = placement
        self.position = position
        self.printStyle = printStyle
    }
}

extension StrongAccent: Equatable {}
extension StrongAccent: Codable {
    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.position = try Position(from: decoder)
        self.printStyle = try PrintStyle(from: decoder)
        // Decode one-off attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(UpDown.self, forKey: .type)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    }
}
