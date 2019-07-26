//
//  StringMute.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The string-mute type represents string mute on and mute off symbols.
public struct StringMute {
    public let type: OnOff
    public let printStyleAlign: PrintStyleAlign?
}

extension StringMute: Equatable { }
extension StringMute: Codable { }
