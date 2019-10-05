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

    public init(type: OnOff, printStyleAlign: PrintStyleAlign? = nil) {
        self.type = type
        self.printStyleAlign = printStyleAlign
    }
}

extension StringMute: Equatable { }
extension StringMute: Codable { }
