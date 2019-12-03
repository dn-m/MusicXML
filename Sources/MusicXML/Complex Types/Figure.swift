//
//  Figure.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The figure type represents a single figure within a figured-bass element.
public struct Figure {
    // MARK: - Instance Properties

    /// Values for prefix and suffix include plus and
    /// the accidental values sharp, flat, natural, double-sharp,
    /// flat-flat, and sharp-sharp.
    public let prefix: StyleText?
    /// A figure-number is a number. Overstrikes of the figure number are represented in the suffix
    /// element.
    public let figureNumber: StyleText?
    /// Values for the suffix element include the accidental values sharp, flat, natural,
    /// double-sharp, flat-flat, and sharp-sharp. Suffixes include both symbols that come after the
    /// figure number and those that overstrike the figure number. The suffix value slash is used
    /// for slashed numbers indicating chromatic alteration. The orientation and display of the
    /// slash usually depends on the figure number. The suffix element may contain additional values
    /// for symbols specific to particular figured bass styles.
    public let suffix: StyleText?
    /// The extend type represents lyric word extension / melisma lines as well as figured bass
    /// extensions.
    public let extend: Extend?

    // MARK: - Initializers

    public init(prefix: StyleText? = nil, figureNumber: StyleText? = nil, suffix: StyleText? = nil, extend: Extend? = nil) {
        self.prefix = prefix
        self.figureNumber = figureNumber
        self.suffix = suffix
        self.extend = extend
    }
}

extension Figure: Equatable {}
extension Figure: Codable {
    private enum CodingKeys: String, CodingKey {
        case prefix
        case figureNumber = "figure-number"
        case suffix
        case extend
    }
}
