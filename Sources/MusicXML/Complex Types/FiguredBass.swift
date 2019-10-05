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

    public let printStyle: PrintStyle
    public let printout: Printout

    // > The value of parentheses is "no" if not present.
    public let parentheses: Bool

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

    public init(printStyle: PrintStyle, printout: Printout, parentheses: Bool = false, figures: [Figure], duration: Int? = nil, footnote: FormattedText? = nil, level: Level? = nil) {
        self.printStyle = printStyle
        self.printout = printout
        self.parentheses = parentheses
        self.figures = figures
        self.duration = duration
        self.footnote = footnote
        self.level = level
    }
}

extension FiguredBass: Equatable { }
extension FiguredBass: Codable { }
