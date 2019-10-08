//
//  Notehead.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The notehead element indicates shapes other than the open and closed ovals associated with note
/// durations. For the enclosed shapes, the default is to be hollow for half notes and longer, and
/// filled otherwise. The filled attribute can be set to change this if needed.
public struct Notehead {
    public let value: NoteheadValue
    public let filled: Bool?
    public let parentheses: Bool?
    public let font: Font
    public let color: Color?

    public init(value: NoteheadValue, filled: Bool? = nil, parentheses: Bool? = nil, font: Font = Font(), color: Color? = nil) {
        self.value = value
        self.filled = filled
        self.parentheses = parentheses
        self.font = font
        self.color = color
    }
}

extension Notehead: Equatable { }
extension Notehead: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case filled
        case parentheses
        case color
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(NoteheadValue.self, forKey: .value)
        self.filled = try container.decodeIfPresent(Bool.self, forKey: .filled)
        self.parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses)
        self.font = try Font(from: decoder)
        self.color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}
