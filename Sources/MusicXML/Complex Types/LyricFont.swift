//
//  LyricFont.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The lyric-font type specifies the default font for a particular name and number of lyric.
public struct LyricFont {
    // MARK: - Instance Properties

    public let number: Int?
    public let name: String?

    // MARK: Attribute Groups

    public let font: Font

    // MARK: - Initializers

    public init(_ font: Font = Font(), number: Int? = nil, name: String? = nil) {
        self.font = font
        self.number = number
        self.name = name
    }
}

extension LyricFont: Equatable {}
extension LyricFont: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case number
        case name
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        self.font = try Font(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        try font.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(name, forKey: .name)
    }
}
