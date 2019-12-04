//
//  TimeModification.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// Time modification indicates tuplets, double-note tremolos, and other durational changes. A
/// time-modification element shows how the cumulative, sounding effect of tuplets and double-note
/// tremolos compare to the written note type represented by the type and dot elements. Nested
/// tuplets and other notations that use more detailed information need both the time-modification
/// and tuplet elements to be represented accurately.
public struct TimeModification {
    // MARK: - Instance Properties

    // MARK: Elements

    /// The actual-notes element describes how many notes are played in the time usually occupied by
    /// the number in the normal-notes element.
    public var actualNotes: Int
    /// The normal-notes element describes how many notes are usually played in the time occupied by
    /// the number in the actual-notes element.
    public var normalNotes: Int
    /// If the type associated with the number in the normal-notes element is different than the
    /// current note type (e.g., a quarter note within an eighth note triplet), then the
    /// normal-notes type (e.g. eighth) is specified in the normal-type and normal-dot elements.
    public var normalType: NoteTypeValue?
    /// The normal-dot element is used to specify dotted normal tuplet types.
    public var normalDotCount: Int

    // MARK: - Initializers

    public init(
        actualNotes: Int,
        normalNotes: Int,
        normalType: NoteTypeValue? = nil,
        normalDotCount: Int = 0
    ) {
        self.actualNotes = actualNotes
        self.normalNotes = normalNotes
        self.normalType = normalType
        self.normalDotCount = normalDotCount
    }
}

extension TimeModification: Equatable {}
extension TimeModification: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case actualNotes = "actual-notes"
        case normalNotes = "normal-notes"
        case normalType = "normal-type"
        case normalDotCount = "normal-dot"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actualNotes = try container.decode(Int.self, forKey: .actualNotes)
        self.normalNotes = try container.decode(Int.self, forKey: .normalNotes)
        self.normalType = try container.decodeIfPresent(NoteTypeValue.self, forKey: .normalType)
        self.normalDotCount = try container.decode([Empty].self, forKey: .normalDotCount).count
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(actualNotes, forKey: .actualNotes)
        try container.encode(normalNotes, forKey: .normalNotes)
        try container.encodeIfPresent(normalType, forKey: .normalType)
        try container.encode([Empty](repeating: Empty(), count: normalDotCount), forKey: .normalDotCount)
    }
}
