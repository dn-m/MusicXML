//
//  HoleClosed.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The hole-closed type represents whether the hole is closed, open, or half-open.
public struct HoleClosed {
    public let value: HoleClosedValue
    /// The optional location attribute indicates which portion of the hole is filled in when the
    /// element value is half.
    public let location: HoleClosedLocation?
}

extension HoleClosed: Equatable { }
extension HoleClosed: Decodable { }
