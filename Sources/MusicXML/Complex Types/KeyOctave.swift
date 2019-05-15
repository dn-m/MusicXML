//
//  KeyOctave.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The key-octave element specifies in which octave an element of a key signature appears. The
/// content specifies the octave value using the same values as the display-octave element.
public struct KeyOctave {
    public let number: Int
    public let cancel: Bool
}

extension KeyOctave: Equatable { }
extension KeyOctave: Decodable { }
