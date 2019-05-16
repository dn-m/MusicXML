//
//  Lyric.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

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
    public let placement: Placement?
    public let printObject: Bool?

    /// The end-line element comes from RP-017 for Standard MIDI File Lyric meta-events. It
    /// facilitates lyric display for Karaoke and similar applications.
    public let endLine: Empty?
    /// The end-paragraph element comes from RP-017 for Standard MIDI File Lyric meta-events. It
    /// facilitates lyric display for Karaoke and similar applications.
    public let endParagraph: Empty?

    public let kind: Kind
}

extension Lyric {

    #warning("TODO: Verify Content Model of Lyric.Verbal")
    public struct Verbal {
        public let text: TextElementData
        public let syllabic: Syllabic?
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
extension Lyric.Verbal: Decodable { }

extension Lyric.NonVerbal: Equatable { }
extension Lyric.NonVerbal: Decodable { }

extension Lyric.Kind: Equatable { }
extension Lyric.Kind: Decodable {
    #warning("TODO: Implement Lyric.Kind: Decodable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Lyric.Kind.init(from: Decoder) not yet implemented!")
    }
}

extension Lyric: Equatable { }
extension Lyric: Decodable { }
