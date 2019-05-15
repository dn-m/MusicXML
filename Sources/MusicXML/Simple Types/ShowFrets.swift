//
//  ShowFrets.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The show-frets type indicates whether to show tablature frets as numbers (0, 1, 2) or letters
/// (a, b, c). The default choice is numbers.
public enum ShowFrets: String {
    case numbers
    case letters
}

extension ShowFrets: Equatable { }
extension ShowFrets: Decodable { }
