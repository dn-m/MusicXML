//
//  NoteheadText.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

public struct NoteheadText {
    public enum Kind {
        case displayText(FormattedText)
        case accidentalText(AccidentalText)
    }
    public let values: [Kind] // NonEmpty
}

extension NoteheadText.Kind: Equatable { }
extension NoteheadText.Kind: Decodable {
    #warning("TODO: Implement NoteheadText.Kind: Decodable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("NoteheadText.Kind.init(from: Decoder) not yet implemented!")
    }
}

extension NoteheadText: Equatable { }
extension NoteheadText: Decodable { }
