//
//  Slur.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Slur types are empty. Most slurs are represented with two elements: one with a start type, and
/// one with a stop type. Slurs can add more elements using a continue type. This is typically used
/// to specify the formatting of cross-system slurs, or to specify the shape of very complex slurs.
public struct Slur {
    public let type: StartStopContinue
    public let number: Int?
    public let lineType: LineType?
    public let dashedFormatting: DashedFormatting?
    public let position: Position?
    public let placement: AboveBelow?
    public let orientation: OverUnder?
    public let bezier: Bezier?
    public let color: Color?

    public init(type: StartStopContinue, number: Int? = nil, lineType: LineType? = nil, dashedFormatting: DashedFormatting? = nil, position: Position? = nil, placement: AboveBelow? = nil, orientation: OverUnder? = nil, bezier: Bezier? = nil, color: Color? = nil) {
        self.type = type
        self.number = number
        self.lineType = lineType
        self.dashedFormatting = dashedFormatting
        self.position = position
        self.placement = placement
        self.orientation = orientation
        self.bezier = bezier
        self.color = color
    }
}

extension Slur: Equatable { }
extension Slur: Codable { }
