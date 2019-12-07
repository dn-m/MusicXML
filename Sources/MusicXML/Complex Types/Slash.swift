//
//  Slash.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The slash type is used to indicate that slash notation is to be used.
public struct Slash {
    // MARK: - Instance Properties

    // MARK: Attributes

    /// The type attribute indicates whether this is the start or stop of a slash notation style.
    public let type: StartStop
    /// The use-dots attribute works as it does for the beat-repeat element, and only has effect if
    /// use-stems is no.
    public let useDots: Bool?
    /// To indicate rhythms but not pitches, use-stems is set to yes. If the slash is on every beat,
    /// use-stems is no (the default).
    public let useStems: Bool?

    // MARK: Elements

    /// The slash-type element indicates the graphical note type to use for the display of
    /// repetition marks. The slash-dot element is used to specify any augmentation dots in the note
    /// type used to display repetition marks.
    public let item: Item?

    // MARK: - Initializers

    public init(
        type: StartStop,
        useDots: Bool? = nil,
        useStems: Bool? = nil,
        item: Item? = nil
    ) {
        self.type = type
        self.useDots = useDots
        self.useStems = useStems
        self.item = item
    }
}

extension Slash {
    public struct Item: Equatable {
        /// The slash-type element indicates the graphical note type to use for the display of
        /// repetition marks.
        let type: NoteTypeValue
        /// The slash-dot element is used to specify any augmentation dots in the note type used to
        /// display repetition marks.
        let dotsCount: Int
    }
}

extension Slash: Equatable {}
extension Slash: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case useDots = "use-dots"
        case useStems = "use-stems"
        case slashType = "slash-type"
        case slashDot = "slash-dot"
    }

    // MARK: - Initializers

    // MARK: - Initializers

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        // Decode attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(StartStop.self, forKey: .type)
        self.useDots = try container.decodeIfPresent(Bool.self, forKey: .useDots)
        self.useStems = try container.decodeIfPresent(Bool.self, forKey: .useStems)

        // Decode item
        if let slashType = try container
            .decodeIfPresent(NoteTypeValue.self, forKey: .slashType) {
            let dotsContainer = try container.decode([Empty].self, forKey: .slashDot)
            self.item = Item(type: slashType, dotsCount: dotsContainer.count)
        } else {
            self.item = nil
        }
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        fatalError("TODO: Implement Slash.encode(to:)")
    }
}
