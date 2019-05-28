//
//  VirtualInstrument.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The virtual-instrument element defines a specific virtual instrument used for an instrument
/// sound.
public struct VirtualInstrument {
    public let library: String?
    public let name: String?
}

extension VirtualInstrument: Equatable { }
extension VirtualInstrument: Decodable { }
