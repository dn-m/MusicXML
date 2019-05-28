//
//  HammerOnPullOff.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The hammer-on and pull-off elements are used in guitar and fretted instrument notation. Since a
/// single slur can be marked over many notes, the hammer-on and pull-off elements are separate so
/// the individual pair of notes can be specified. The element content can be used to specify how
/// the hammer-on or pull-off should be notated. An empty element leaves this choice up to the
/// application.
public struct HammerOnPullOff {
    public let value: String
    public let type: StartStop
    public let number: Int?
    public let printStyle: PrintStyle?
    public let placement: AboveBelow?
}

extension HammerOnPullOff: Equatable { }
extension HammerOnPullOff: Decodable { }
