//
//  NoteType.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The note-type type indicates the graphic note type. Values range from 256th to long.
public struct NoteType {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let size: SymbolSize?
    
    // MARK: Value

    public let value: NoteTypeValue

    // MARK: Initializers

    public init(_ value: NoteTypeValue, size: SymbolSize? = nil) {
        self.value = value
        self.size = size
    }
}

extension NoteType {
    // MARK: - Type Properties

    public static let maxima = NoteType(.maxima)
    public static let long = NoteType(.long)
    public static let breve = NoteType(.breve)
    public static let whole = NoteType(.whole)
    public static let half = NoteType(.half)
    public static let quarter = NoteType(.quarter)
    public static let eighth = NoteType(.eighth)
    public static let sixteenth = NoteType(.sixteenth)
    public static let thirysecond = NoteType(.thirysecond)
    public static let sixtyfourth = NoteType(.sixtyfourth)
    public static let onehundredtwentyeighth = NoteType(.onehundredtwentyeighth)
    public static let twohundredfiftysixth = NoteType(.twohundredfiftysixth)
    public static let fivehundredtwelfth = NoteType(.fivehundredtwelfth)
    public static let onethousandtwentyfourth = NoteType(.onehundredtwentyeighth)
}

extension NoteType: Equatable {}
extension NoteType: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case size
        case value = ""
    }
}

import XMLCoder
extension NoteType: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
