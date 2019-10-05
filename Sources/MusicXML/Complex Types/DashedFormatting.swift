//
//  DashedFormatting.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//


/// The dashed-formatting entity represents the length of dashes and spaces in a dashed line. Both
/// the dash-length and space-length attributes are represented in tenths. These attributes are
/// ignored if the corresponding line-type attribute is not dashed.
public struct DashedFormatting {
    public let dashLength: Tenths
    public let spaceLength: Tenths

    public init(dashLength: Tenths, spaceLength: Tenths) {
        self.dashLength = dashLength
        self.spaceLength = spaceLength
    }
}

extension DashedFormatting: Equatable { }
extension DashedFormatting: Codable { }
