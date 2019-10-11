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

    // MARK: - Instance Properties

    // MARK: Kind

    public let kind: Kind

    // MARK: One-off Attributes

    /// The lyric number indicates multiple lines, though a name can be used as well (as in Finale's
    /// verse / chorus / section specification).
    public let number: String?

    /// The lyric number indicates multiple lines, though a name can be used as well (as in Finale's
    /// verse / chorus / section specification).
    public let name: String?

    public let justify: LeftCenterRight?
    public let color: Color?
    public let placement: AboveBelow?
    public let printObject: Bool?

    // MARK: Attribute Groups

    public let position: Position

    // MARK: Elements

    /// The end-line element comes from RP-017 for Standard MIDI File Lyric meta-events. It
    /// facilitates lyric display for Karaoke and similar applications.
    public let endLine: Bool
    /// The end-paragraph element comes from RP-017 for Standard MIDI File Lyric meta-events. It
    /// facilitates lyric display for Karaoke and similar applications.
    public let endParagraph: Bool

    public let level: Level?

    // MARK: - Initializers

    public init(
        kind: Kind,
        number: String? = nil,
        name: String? = nil,
        justify: LeftCenterRight? = nil,
        position: Position = Position(),
        placement: AboveBelow? = nil,
        printObject: Bool? = nil,
        color: Color? = nil,
        endLine: Bool = false,
        endParagraph: Bool = false,
        level: Level? = nil
    ) {
        self.kind = kind
        self.number = number
        self.name = name
        self.justify = justify
        self.position = position
        self.placement = placement
        self.printObject = printObject
        self.endLine = endLine
        self.endParagraph = endParagraph
        self.color = color
        self.level = level
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

extension Lyric: Equatable { }
extension Lyric: Codable {

    enum CodingKeys: String, CodingKey {
        case kind
        case number
        case name
        case justify
        case color
        case position
        case printObject = "print-object"
        case endLine = "end-line"
        case endParagraph = "end-paragraph"
        case extend
        case laughing
        case humming
        case syllabic
        case text
        case elision
        case level
    }

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Decode attribute groups
        self.position = try Position(from: decoder)

        // Decode one-off attributes
        self.number = try container.decodeIfPresent(String.self, forKey: .number)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)

        // FIXME:
        self.justify = nil
        self.color = nil
        self.placement = nil
        self.printObject = nil

        // Decode elements

        // FIXME:
        self.endLine = false
        self.endParagraph = false
        self.level = nil

        do {
            // Attempt to decode verbal `Lyric`
            self.kind = .verbal(
                Verbal(
                    text: try container.decode(TextElementData.self, forKey: .text),
                    syllabic: try container.decodeIfPresent(Syllabic.self, forKey: .syllabic)
                )
            )
        } catch {
            throw error
        }
    }

    public func encode(to encoder: Encoder) throws {
        fatalError()
    }
}


//extension Lyric.Kind: Codable {
//    enum CodingKeys: String, CodingKey {
//        case verbal
//        case nonVerbal
//    }
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        switch self {
//        case let .verbal(value):
//            try container.encode(value, forKey: .verbal)
//        case let .nonVerbal(value):
//            try container.encode(value, forKey: .nonVerbal)
//        }
//    }
//
//    public init(from decoder: Decoder) throws {
//
//        // Decode one-off attributes
//
//
//        // Decode attribute groups
//
//
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        if container.contains(.verbal) {
////            self = .verbal(try container.decode(Lyric.Verbal.self, forKey: .verbal))
////        } else if container.contains(.nonVerbal) {
////            self = .nonVerbal(try container.decode(Lyric.NonVerbal.self, forKey: .nonVerbal))
////        } else {
////            throw DecodingError.typeMismatch(
////                Lyric.Kind.self,
////                DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unrecognized lyric"))
////        }
//        fatalError()
//    }
//}

//extension Lyric.Kind.CodingKeys: XMLChoiceCodingKey { }
