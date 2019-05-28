//
//  SystemMargins.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// System margins are relative to the page margins. Positive values indent and negative values
/// reduce the margin size.
public struct SystemMargins {
    public let left: Tenths
    public let right: Tenths
}

extension SystemMargins: Equatable { }
extension SystemMargins: Decodable { }
