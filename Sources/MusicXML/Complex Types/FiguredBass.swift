//
//  FiguredBass.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The figured-bass element represents figured bass notation. Figured bass elements take their
/// position from the first regular note (not a grace note or chord note) that follows in score
/// order. The optional duration element is used to indicate changes of figures under a note.
/// Figures are ordered from top to bottom. The value of parentheses is "no" if not present.
public struct FiguredBass {
    // MARK: - Instance Properties

    // MARK: Attribute Groups

    public let printStyle: PrintStyle
    public let printout: Printout

    // MARK: Attributes

    // > The value of parentheses is "no" if not present.
    public let parentheses: Bool?

    /// The figure type represents a single figure within a figured-bass element.
    public let figures: [Figure] // NonEmpty

    /// Duration is a positive number specified in division units. This is the intended duration vs.
    /// notated duration (for instance, swing eighths vs. even eighths, or differences in dotted
    /// notes in Baroque-era music). Differences in duration specific to an interpretation or
    /// performance should use the note element's attack and release attributes.
    public let duration: Int?

    /// The footnote element specifies editorial information that appears in footnotes in the
    /// printed score. It is defined within a group due to its multiple uses within the MusicXML
    /// schema.
    public let footnote: FormattedText?

    /// The level type is used to specify editorial information for different MusicXML elements.
    public let level: Level?

    public init(
        _ figures: [Figure],
        printStyle: PrintStyle = PrintStyle(),
        printout: Printout = Printout(),
        parentheses: Bool? = nil,
        duration: Int? = nil,
        footnote: FormattedText? = nil,
        level: Level? = nil
    ) {
        self.printStyle = printStyle
        self.printout = printout
        self.parentheses = parentheses
        self.figures = figures
        self.duration = duration
        self.footnote = footnote
        self.level = level
    }
}

extension FiguredBass: Equatable {}
extension FiguredBass: Codable {
    private enum CodingKeys: String, CodingKey {
        case figures = "figure"
        case duration
        case footnote
        case level
        case parentheses
    }

    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.printStyle = try PrintStyle(from: decoder)
        self.printout = try Printout(from: decoder)
        // Decode one-off attribute
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses)
        self.duration = try container.decodeIfPresent(Int.self, forKey: .duration)
        self.footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
        self.level = try container.decodeIfPresent(Level.self, forKey: .level)
        // Decode elements
        self.figures = try container.decode([Figure].self, forKey: .figures)
    }

    // sourcery:inline:FiguredBass.AutoEncodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try printStyle.encode(to: encoder)
        try printout.encode(to: encoder)
        try container.encodeIfPresent(YesNo(parentheses), forKey: .parentheses)
        try container.encode(figures, forKey: .figures)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(footnote, forKey: .footnote)
        try container.encodeIfPresent(level, forKey: .level)
    }
    // sourcery:end
}
