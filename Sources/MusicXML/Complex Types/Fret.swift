//
//  Fret.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The fret element is used with tablature notation and chord diagrams. Fret numbers start with 0
/// for an open string and 1 for the first fret.
public struct Fret {

    // MARK: - Instance Properties

    // MARK: Value

    public let value: Int

    // MARK: One-off Attributes

    public let color: Color?

    // MARK: - Attribute Groups

    public let font: Font

    // MARK: - Initializers

    public init(
        _ value: Int = 0,
        color: Color? = nil,
        font: Font = Font()
    ) {
        self.value = value
        self.font = font
        self.color = color
    }
}

extension Fret: Equatable { }
extension Fret: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case color
    }
    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.font = try Font(from: decoder)
        // Decode one-off attribute
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.color = try container.decodeIfPresent(Color.self, forKey: .color)
        // Decode value
        do {
            self.value = try container.decode(Int.self, forKey: .value)
        } catch {
            self.value = 0
        }
    }
    public func encode(to encoder: Encoder) throws {
        var singleValueContainer = encoder.singleValueContainer()
        try singleValueContainer.encode(font)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encodeIfPresent(color, forKey: .color)
    }
}

extension Fret: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}
