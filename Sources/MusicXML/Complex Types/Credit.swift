//
//  Credit.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

import XMLCoder

/// The credit type represents the appearance of the title, composer, arranger, lyricist, copyright,
/// dedication, and other text and graphics that commonly appears on the first page of a score. The
/// credit-words and credit-image elements are similar to the words and image elements for
/// directions. However, since the credit is not part of a measure, the default-x and default-y
/// attributes adjust the origin relative to the bottom left-hand corner of the first page. The
/// enclosure for credit-words is none by default. By default, a series of credit-words elements
/// within a single credit element follow one another in sequence visually. Non-positional
/// formatting attributes are carried over from the previous element by default. The credit-type
/// element, new in Version 3.0, indicates the purpose behind a credit. Multiple types of data may
/// be combined in a single credit, so multiple elements may be used. Standard values include page
/// number, title, subtitle, composer, arranger, lyricist, and rights.
public struct Credit {

    /// The page attribute for the credit element specifies the page number where the credit should
    /// appear. This is an integer value that starts with 1 for the first page. Its value is 1 by
    /// default. Since credits occur before the music, these page numbers do not refer to the page
    /// numbering specified by the print element's page-number attribute.
    public let page: Int?

    /// The credit-type element indicates the purpose behind a
    /// credit. Multiple types of data may be combined in a single
    /// credit, so multiple elements may be used. Standard values
    /// include page number, title, subtitle, composer, arranger,
    /// lyricist, and rights.
    public let types: [String]?

    /// The link type serves as an outgoing simple XLink. It is also used to connect a MusicXML
    /// score with a MusicXML opus. If a relative link is used within a document that is part of a
    /// compressed MusicXML file, the link is relative to the  root folder of the zip file.
    public let link: [Link]?
    public let bookmarks: [Bookmark]?

    public init(page: Int? = nil, types: [String]? = nil, link: [Link]? = nil, bookmarks: [Bookmark]? = nil) {
        self.page = page
        self.types = types
        self.link = link
        self.bookmarks = bookmarks
    }
}

extension Credit {

    public struct Words {
        public let words: FormattedText
        public let links: [Link]
        public let bookmark: [Bookmark]

        public init(words: FormattedText, links: [Link], bookmark: [Bookmark]) {
            self.words = words
            self.links = links
            self.bookmark = bookmark
        }
    }

    // FIXME: Establish correct model for Credit.Kind.words
    public enum Kind {
        case image(Image)
        case words([Words])
        // case words(FormattedText, [Words])
    }
}

extension Credit.Words: Equatable { }
extension Credit.Words: Codable { }

extension Credit.Kind: Equatable { }
extension Credit.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case image
        case words
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .image(value):
            try container.encode(value, forKey: .image)
        case let .words(value):
            try container.encode(value, forKey: .words)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.image) {
            self = .image(try decode(.image))
        } else if container.contains(.words) {
            self = .words(try decode(.words))
        } else {
            throw DecodingError.typeMismatch(
                Credit.Kind.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension Credit.Kind.CodingKeys: XMLChoiceCodingKey { }

extension Credit: Equatable { }
extension Credit: Codable { }
