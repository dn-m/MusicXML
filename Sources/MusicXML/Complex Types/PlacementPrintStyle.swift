//
//  PlacementPrintStyle.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-placement type represents an empty element with print-style and placement attributes.
public struct PlacementPrintStyle {
    // MARK: - Instance Properties

    // MARK: Attributes

    public var placement: AboveBelow?

    // MARK: Attribute Groups

    public var position: Position
    public var printStyle: PrintStyle

    // MARK: - Initializers

    public init(
        position: Position = Position(),
        printStyle: PrintStyle = PrintStyle(),
        placement: AboveBelow? = nil
    ) {
        self.position = position
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension PlacementPrintStyle: Equatable {}
extension PlacementPrintStyle: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case placement
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.position = try Position(from: decoder)
        self.printStyle = try PrintStyle(from: decoder)
        // Decode one-off attribute
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    }
}

extension PlacementPrintStyle.CodingKeys: XMLAttributeGroupCodingKey {}
