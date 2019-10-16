//
//  LyricFont.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The lyric-font type specifies the default font for a particular name and number of lyric.
public struct LyricFont {

    public let font: Font
    public let number: Int?
    public let name: String?

    public init(_ font: Font, number: Int? = nil, name: String? = nil) {
        self.font = font
        self.number = number
        self.name = name
    }
}

extension LyricFont: Equatable { }
extension LyricFont: Codable {
    private enum CodingKeys: String, CodingKey {
        case number
        case name
    }
    public init(from decoder: Decoder) throws {
        self.font = try Font(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
    public func encode(to encoder: Encoder) throws {
        fatalError()
    }
}
