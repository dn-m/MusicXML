//
//  Hole.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The hole type represents the symbols used for woodwind and brass fingerings as well as other
/// notations.
public struct Hole {
    /// The content of the optional hole-type element indicates what the hole symbol represents in
    /// terms of instrument fingering or other techniques.
    public let holeType: String?
    /// The hole-closed type represents whether the hole is closed, open, or half-open. The optional
    /// location attribute indicates which portion of the hole is filled in when the element value
    /// is half.
    public let holeClosed: HoleClosed
    /// The optional hole-shape element indicates the shape of the hole symbol; the default is a
    /// circle.
    public let holeShape: String?
    public let printStyle: PrintStyle?
    public let placement: AboveBelow?
}

extension Hole: Equatable { }
extension Hole: Decodable { }
