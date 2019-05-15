//
//  PrincipleVoiceSymbol.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The principal-voice-symbol type represents the type of symbol used to indicate the start of a
/// principal or secondary voice. The "plain" value represents a plain square bracket. The value of
/// "none" is used for analysis markup when the principal-voice element does not have a
/// corresponding appearance in the score.
public enum PrincipleVoiceSymbol: String {
    case haupstimme = "Haupstimme"
    case nebenstimme = "Nebenstimme"
    case plain
    case none
}

extension PrincipleVoiceSymbol: Equatable { }
extension PrincipleVoiceSymbol: Decodable { }
