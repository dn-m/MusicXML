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

    // MARK: Attributes

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

    // MARK: Kind

    public let kind: Kind

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
    // TODO: Verify Content Model of Lyric.Verbal
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
    public enum NonVerbal {
        case extend(Extend)
        case laughing
        case humming
    }

    public enum Kind {
        case verbal(Verbal)
        case nonVerbal(NonVerbal)
    }
}

extension Lyric.Verbal: Equatable {}
extension Lyric.Verbal: Codable {}

extension Lyric.NonVerbal: Equatable {}

extension Lyric.Kind: Equatable {}

extension Lyric: Equatable {}
extension Lyric: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case kind
        case number
        case name
        case justify
        case color
        case position
        case placement
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

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Decode attribute groups
        self.position = try Position(from: decoder)

        // Decode one-off attributes
        self.number = try container.decodeIfPresent(String.self, forKey: .number)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)

        self.justify = try container.decodeIfPresent(LeftCenterRight.self, forKey: .justify)
        self.color = try container.decodeIfPresent(Color.self, forKey: .color)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)

        // Decode elements

        self.endLine = container.contains(.endLine)
        self.endParagraph = container.contains(.endParagraph)
        self.level = try container.decodeIfPresent(Level.self, forKey: .level)

        do {
            // Attempt to decode verbal `Lyric`
            self.kind = .verbal(
                Verbal(
                    text: try container.decode(TextElementData.self, forKey: .text),
                    syllabic: try container.decodeIfPresent(Syllabic.self, forKey: .syllabic)
                )
            )
        } catch {
            // Attempt to decode non-verbal `Lyric`
            let nonVerbal: NonVerbal
            if container.contains(.laughing) { nonVerbal = .laughing }
            else if container.contains(.humming) { nonVerbal = .humming }
            else if container.contains(.extend) {
                nonVerbal = .extend(try container.decode(Extend.self, forKey: .extend))
            } else {
                throw DecodingError.typeMismatch(
                    Lyric.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unrecognized Lyric"
                    )
                )
            }
            self.kind = .nonVerbal(nonVerbal)
        }
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        fatalError()
    }
}

extension Lyric: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number, CodingKeys.name, CodingKeys.justify, CodingKeys.color, CodingKeys.placement, CodingKeys.printObject:
            return .attribute
        default:
            return .element
        }
    }
}
