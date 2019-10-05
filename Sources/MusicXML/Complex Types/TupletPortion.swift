//
//  TupletPortion.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tuplet-portion type provides optional full control over tuplet specifications. It allows the
/// number and note type (including dots) to be set for the actual and normal portions of a single
/// tuplet. If any of these elements are absent, their values are based on the time-modification
/// element.
public struct TupletPortion {
    public let tupletNumber: TupletNumber?
    public let tupletType: TupletType?
    public let tupletDot: [TupletDot]

    public init(tupletNumber: TupletNumber? = nil, tupletType: TupletType? = nil, tupletDot: [TupletDot]) {
        self.tupletNumber = tupletNumber
        self.tupletType = tupletType
        self.tupletDot = tupletDot
    }
}

extension TupletPortion: Equatable { }
extension TupletPortion: Codable { }
