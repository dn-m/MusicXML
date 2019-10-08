//
//  Lyric.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

import XMLCoder

/// The lyric type represents text underlays for lyrics, based on Humdrum with support for other
/// formats. Two text elements that are not separated by an elision element are part of the same
/// syllable, but may have different text formatting. The MusicXML 2.0 XSD is more strict than the
/// 2.0 DTD in enforcing this by disallowing a second syllabic element unless preceded by an elision
/// element. The lyric number indicates multiple lines, though a name can be used as well (as in
/// Finale's verse / chorus / section specification). Justification is center by default; placement
/// is below by default. The content of the elision type is used to specify the symbol used to
/// display the elision. Common values are a no-break space (Unicode 00A0), an underscore (Unicode
/// 005F), or an undertie (Unicode 203F).
public struct Lyric {
    /// The lyric number indicates multiple lines, though a name can be used as well (as in Finale's
    /// verse / chorus / section specification).
    public let number: String?
    /// The lyric number indicates multiple lines, though a name can be used as well (as in Finale's
    /// verse / chorus / section specification).
    public let name: String?
    public let justify: LeftCenterRight?
    public let position: Position?
    public let placement: AboveBelow?
    public let printObject: Bool?

    /// The end-line element comes from RP-017 for Standard MIDI File Lyric meta-events. It
    /// facilitates lyric display for Karaoke and similar applications.
    public let endLine: Empty?
    /// The end-paragraph element comes from RP-017 for Standard MIDI File Lyric meta-events. It
    /// facilitates lyric display for Karaoke and similar applications.
    public let endParagraph: Empty?

    public let kind: Kind

    public init(number: String? = nil, name: String? = nil, justify: LeftCenterRight? = nil, position: Position? = nil, placement: AboveBelow? = nil, printObject: Bool? = nil, endLine: Empty? = nil, endParagraph: Empty? = nil, kind: Kind) {
        self.number = number
        self.name = name
        self.justify = justify
        self.position = position
        self.placement = placement
        self.printObject = printObject
        self.endLine = endLine
        self.endParagraph = endParagraph
        self.kind = kind
    }
}

extension Lyric {

    #warning("TODO: Verify Content Model of Lyric.Verbal")
    public struct Verbal {
        public let text: TextElementData
        public let syllabic: Syllabic?

        public init(text: TextElementData, syllabic: Syllabic? = nil) {
            self.text = text
            self.syllabic = syllabic
        }
    }

    // > Humming and laughing representations are taken from
    // > Humdrum.
    public enum NonVerbal: String {
        case extend
        case laughing
        case humming
    }

    public enum Kind {
        case verbal(Verbal)
        case nonVerbal(NonVerbal)
    }
}

extension Lyric.Verbal: Equatable { }
extension Lyric.Verbal: Codable { }

extension Lyric.NonVerbal: Equatable { }
extension Lyric.NonVerbal: Codable { }

extension Lyric.Kind: Equatable { }
extension Lyric.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case verbal
        case nonVerbal
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .verbal(value):
            try container.encode(value, forKey: .verbal)
        case let .nonVerbal(value):
            try container.encode(value, forKey: .nonVerbal)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.verbal) {
            self = .verbal(try container.decode(Lyric.Verbal.self, forKey: .verbal))
        } else if container.contains(.nonVerbal) {
            self = .nonVerbal(try container.decode(Lyric.NonVerbal.self, forKey: .nonVerbal))
        } else {
            throw DecodingError.typeMismatch(
                Lyric.Kind.self,
                DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unrecognized lyric"))
        }
    }
}

extension Lyric.Kind.CodingKeys: XMLChoiceCodingKey { }

extension Lyric: Equatable { }
extension Lyric: Codable { }
