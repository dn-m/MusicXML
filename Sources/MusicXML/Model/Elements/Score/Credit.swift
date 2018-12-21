//
//  Credit.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

// > Credit elements refer to the title, composer, arranger,
// > lyricist, copyright, dedication, and other text, symbols,
// > and graphics that commonly appear on the first page of a
// > score. The credit-words, credit-symbol, and credit-image
// > elements are similar to the words, symbol, and image
// > elements for directions. However, since the credit is not
// > part of a measure, the default-x and default-y attributes
// > adjust the origin relative to the bottom left-hand corner
// > of the page. The  enclosure for credit-words and
// > credit-symbol is none by default.
// > By default, a series of credit-words and credit-symbol
// > elements within a single credit element follow one another
// > in sequence visually. Non-positional formatting attributes
// > are carried over from the previous element by default.
//
// <!ELEMENT credit
//    (credit-type*, link*, bookmark*,
//     (credit-image |
//      ((credit-words | credit-symbol),
//       (link*, bookmark*, (credit-words | credit-symbol))*)))>
// <!ATTLIST credit
//    page NMTOKEN #IMPLIED
//    %optional-unique-id;
// >
#warning("TODO: Get head around Credit definition 🤯")
public struct Credit: Decodable, Equatable {

    // <!ELEMENT credit-words (#PCDATA)>
    // <!ATTLIST credit-words
    //    %text-formatting;
    //    %optional-unique-id;
    // >
    public struct Words: Decodable, Equatable {
        let text: String
        let formatting: TextFormatting
        let optionalUniqueID: String?
    }

    // > The credit-symbol element specifies a musical symbol
    // > using a canonical SMuFL glyph name.
    //
    // <!ELEMENT credit-symbol (#PCDATA)>
    // <!ATTLIST credit-symbol
    //    %symbol-formatting;
    //    %optional-unique-id;
    // >
    public struct Symbol: Decodable, Equatable {
        let name: String
        let symbolFormatting: SymbolFormatting?
        let optionalUniqueID: String?
    }

    // <!ELEMENT credit-image EMPTY>
    // <!ATTLIST credit-image
    //    source CDATA #REQUIRED
    //    type CDATA #REQUIRED
    //    height %tenths; #IMPLIED
    //    width %tenths; #IMPLIED
    //    %position;
    //    %halign;
    //    %valign-image;
    //    %optional-unique-id;
    // >
    public struct Image: Decodable, Equatable {
        let source: String
        let type: String
        let height: Int?
        let width: Int?
        let position: Position?
        let horizontalAlignment: HorizonalAlignment?
        let verticalAlignment: VerticalAlignment?
        let optionalUniqueID: String?
    }

    // > The credit-type element indicates the purpose behind a
    // > credit. Multiple types of data may be combined in a single
    // > credit, so multiple elements may be used. Standard values
    // > include page number, title, subtitle, composer, arranger,
    // > lyricist, and rights.
    // <!ELEMENT credit-type (#PCDATA)>
    let types: [String]?
    let links: [Link]?
    let bookmarks: [Bookmark]?

    // > The page attribute for the credit element specifies the page
    // > number where the credit should appear. This is an integer
    // > value that starts with 1 for the first page. Its value is 1
    // > by default. Since credits occur before the music, these page
    // > numbers do not refer to the page numbering specified by the
    // > print element's page-number attribute.
    let page: Int?
    let optionalUniqueID: String?
}
