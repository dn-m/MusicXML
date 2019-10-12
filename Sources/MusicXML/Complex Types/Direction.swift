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
    public let placement: AboveBelow?
    public let directive: Bool?

    // MARK: - Elements
    public let directionType: [DirectionType]
    public let offset: Offset?
    public let footnote: FormattedText?
    public let level: Level?
    public let voice: String?
    public let staff: UInt?
    public let sound: Sound?

    public init(
        placement: AboveBelow? = nil,
        directive: Bool? = nil,
        directionType: [DirectionType],
        offset: Offset? = nil,
        footnote: FormattedText? = nil,
        level: Level? = nil,
        voice: String? = nil,
        staff: UInt? = nil,
        sound: Sound? = nil
    ) {
        precondition(!directionType.isEmpty)
        self.placement = placement
        self.directive = directive
        self.directionType = directionType
        self.offset = offset
        self.footnote = footnote
        self.level = level
        self.voice = voice
        self.staff = staff
        self.sound = sound
    }
}

extension Direction: Equatable { }
extension Direction: Codable {
    private enum CodingKeys: String, CodingKey {
        case placement
        case directive
        case directionType = "direction-type"
        case offset
        case footnote
        case level
        case voice
        case staff
        case sound
    }
}
