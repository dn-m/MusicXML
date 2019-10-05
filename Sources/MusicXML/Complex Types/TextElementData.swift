//
//  TextElementData.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The text-element-data type represents a syllable or portion of a syllable for lyric text
/// underlay. A hyphen in the string content should only be used for an actual hyphenated word.
/// Language names for text elements come from ISO 639, with optional country subcodes from ISO
/// 3166.
public struct TextElementData {
    public let font: Font?
    public let color: Color?
    public let textDecoration: TextDecoration?
    public let textRotation: Double?
    public let letterSpacing: NumberOrNormal?
    public let dir: TextDirection?

    public init(font: Font? = nil, color: Color? = nil, textDecoration: TextDecoration? = nil, textRotation: Double? = nil, letterSpacing: NumberOrNormal? = nil, dir: TextDirection? = nil) {
        self.font = font
        self.color = color
        self.textDecoration = textDecoration
        self.textRotation = textRotation
        self.letterSpacing = letterSpacing
        self.dir = dir
    }
}

extension TextElementData: Equatable { }
extension TextElementData: Codable { }
