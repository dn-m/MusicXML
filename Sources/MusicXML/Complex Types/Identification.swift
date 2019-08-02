//
//  Identification.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// Identification contains basic metadata about the score. It includes the information in MuseData
/// headers that may apply at a score-wide, movement-wide, or part-wide level. The creator, rights,
/// source, and relation elements are based on Dublin Core.
public struct Identification {
    /// The creator element is borrowed from Dublin Core. It is used for the creators of the score.
    /// The type attribute is used to distinguish different creative contributions. Thus, there can
    /// be multiple creators within an identification. Standard type values are composer, lyricist,
    /// and arranger. Other type values may be used for different types of creative roles. The type
    /// attribute should usually be used even if there is just a single creator element. The
    /// MusicXML format does not use the creator / contributor distinction from Dublin Core.
    public let creator: [String]?
    /// The rights element is borrowed from Dublin Core. It contains copyright and other
    /// intellectual property notices. Words, music, and derivatives can have different types, so
    /// multiple rights tags with different type attributes are supported. Standard type values are
    /// music, words, and arrangement, but other types may be used. The type attribute is only
    /// needed when there are multiple rights elements.
    public let rights: [String]?
    /// The encoding element contains information about who did the digital encoding, when, with
    /// what software, and in what aspects. Standard type values for the encoder element are music,
    /// words, and arrangement, but other types may be used. The type attribute is only needed when
    /// there are multiple encoder elements.
    public let encoding: Encoding?
    /// The source for the music that is encoded. This is similar to the Dublin Core source element.
    public let source: String?
    /// A related resource for the music that is encoded. This is similar to the Dublin Core
    /// relation element. Standard type values are music, words, and arrangement, but other types
    /// may be used.
    public let relation: [String]?
    /// If a program has other metadata not yet supported in the MusicXML format, it can go in the
    /// miscellaneous element. The miscellaneous type puts each separate part of metadata into its
    /// own miscellaneous-field type.
    public let miscellaneous: Miscellaneous?
}

extension Identification: Equatable { }
extension Identification: Codable { }
