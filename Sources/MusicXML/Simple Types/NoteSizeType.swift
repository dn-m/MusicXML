//
//  NoteSizeType.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The note-size-type type indicates the type of note being defined by a note-size element. The
/// grace type is used for notes of cue size that that include a grace element. The cue type is used
/// for all other notes with cue size, whether defined explicitly or implicitly via a cue element.
/// The large type is used for notes of large size.
public enum NoteSizeType: String {
    case cue
    case grace
    case large
}

extension NoteSizeType: Equatable { }
extension NoteSizeType: Decodable { }
