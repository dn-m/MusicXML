//
//  Tied.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tied type represents the notated tie. The tie element represents the tie sound.
public struct Tied {
    public var type: StartStopContinue
    public var number: Int?
    public var lineType: LineType?
    public var dashedFormatting: DashedFormatting?
    public var position: Position?
    public var placement: AboveBelow?
    public var orientation: OverUnder?
    public var bezier: Bezier?
    public var color: Color?

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

extension Tied: Equatable { }
extension Tied: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case number
        case lineType = "line-type"
        case dashedFormatting = "dashed-formatting"
        case position
        case placement
        case orientation
        case bezier
        case color
    }
}
