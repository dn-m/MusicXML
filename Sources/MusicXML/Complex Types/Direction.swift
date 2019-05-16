//
//  Direction.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// A direction is a musical indication that is not attached to a specific note. Two or more may be
/// combined to indicate starts and stops of wedges, dashes, etc.  By default, a series of
/// direction-type elements and a series of child elements of a direction-type within a single
/// direction element follow one another in sequence visually. For a series of direction-type
/// children, non-positional formatting attributes are carried over from the previous element by
/// default.
public struct Direction {
    public let placement: AboveBelow?
    public let directive: Bool?
    public let directionType: DirectionType
}

extension Direction: Equatable { }
extension Direction: Decodable { }
