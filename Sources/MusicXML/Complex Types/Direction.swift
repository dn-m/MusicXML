//
//  Direction.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// A direction is a musical indication that is not attached to a specific note. Two or more may be
/// combined to indicate starts and stops of wedges, dashes, etc.  By default, a series of
/// direction-type elements and a series of child elements of a direction-type within a single
/// direction element follow one another in sequence visually. For a series of direction-type
/// children, non-positional formatting attributes are carried over from the previous element by
/// default.
public struct Direction {

    // MARK: - Attributes

    public var placement: AboveBelow?
    public var directive: Bool?

    // MARK: - Elements

    public var types: [DirectionType]
    public var offset: Offset?
    public var footnote: FormattedText?
    public var level: Level?
    public var voice: String?
    public var staff: Int?
    public var sound: Sound?
}

extension Direction: Equatable { }
extension Direction: Codable {
    enum CodingKeys: String, CodingKey {
        case placement
        case directive
        case types = "direction-type"
        case offset
        case footnote
        case level
        case voice
        case staff
        case sound
    }
    public init(from decoder: Decoder) throws {
        let typesContainer = try decoder.singleValueContainer()
        self.types = try typesContainer.decode([DirectionType].self)
        let elementsContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.offset = try elementsContainer.decodeIfPresent(Offset.self, forKey: .offset)
        self.footnote = try elementsContainer.decodeIfPresent(FormattedText.self, forKey: .footnote)
        self.level = try elementsContainer.decodeIfPresent(Level.self, forKey: .level)
        self.staff = try elementsContainer.decodeIfPresent(Int.self, forKey: .staff)
        self.sound = try elementsContainer.decodeIfPresent(Sound.self, forKey: .sound)
    }
}
