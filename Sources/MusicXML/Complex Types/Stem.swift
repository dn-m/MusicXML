//
//  Stem.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Stems can be down, up, none, or double. For down and up stems, the position attributes can be
/// used to specify stem length. The relative values specify the end of the stem relative to the
/// program default. Default values specify an absolute end stem position. Negative values of
/// relative-y that would flip a stem instead of shortening it are ignored. A stem element
/// associated with a rest refers to a stemlet.
public struct Stem {
    public let value: StemValue
    public let position: Position
    public let color: Color?

    public init(_ value: StemValue, position: Position = Position(), color: Color? = nil) {
        self.value = value
        self.position = position
        self.color = color
    }
}

extension Stem: Equatable { }
extension Stem: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case color
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(StemValue.self, forKey: .value)
        self.position = try Position(from: decoder)
        self.color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}
