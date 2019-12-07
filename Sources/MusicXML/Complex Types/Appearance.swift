//
//  Appearance.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The appearance type controls general graphical settings for the music's final form appearance on
/// a printed page of display. This includes support for line widths, definitions for note sizes,
/// and standard distances between notation elements, plus an extension element for other aspects of
/// appearance.
public struct Appearance {
    // MARK: - Instance Properties

    // MARK: Elements

    public let lineWidths: [LineWidth]
    public let noteSizes: [NoteSize]
    public let distances: [Distance]
    public let otherAppearances: [OtherAppearance]

    // MARK: - Initializers

    public init(
        lineWidths: [LineWidth] = [],
        noteSizes: [NoteSize] = [],
        distances: [Distance] = [],
        otherAppearances: [OtherAppearance] = []
    ) {
        self.lineWidths = lineWidths
        self.noteSizes = noteSizes
        self.distances = distances
        self.otherAppearances = otherAppearances
    }
}

extension Appearance: Equatable {}
extension Appearance: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case lineWidths = "line-width"
        case noteSizes = "note-size"
        case distances = "distance"
        case otherAppearances = "other-appearance"
    }
}

import XMLCoder
// sourcery:inline:Appearance.DynamicNodeEncoding
extension Appearance: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end
