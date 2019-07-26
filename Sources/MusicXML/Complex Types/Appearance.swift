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
    public let lineWidth: LineWidth?
    public let noteSize: NoteSizeType?
    public let distance: Distance?
    // TODO: other-appearance?
}

extension Appearance: Equatable { }
extension Appearance: Codable { }
