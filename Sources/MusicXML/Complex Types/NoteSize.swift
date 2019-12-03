//
//  NoteSize.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The note-size type indicates the percentage of the regular note size to use for notes with a
/// cue and large size as defined in the type element. The grace type is used for notes of cue size
/// that that include a grace element. The cue type is used for all other notes with cue size,
/// whether defined explicitly or implicitly via a cue element. The large type is used for notes of
/// large size. The text content represents the numeric percentage. A value of 100 would be
/// identical to the size of a regular note as defined by the music font.
public struct NoteSize {
    // MARK: - Instance Properties

    // FIXME: Use `NonNegativeDecimal` if that is wise.
    public let value: Double
    public let type: NoteSizeType

    // MARK: - Initializers

    public init(_ value: Double, type: NoteSizeType) {
        self.value = value
        self.type = type
    }
}

extension NoteSize: Equatable {}
extension NoteSize: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case value = ""
    }
}

import XMLCoder
extension NoteSize: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
