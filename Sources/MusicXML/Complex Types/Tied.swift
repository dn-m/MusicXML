//
//  Tied.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tied type represents the notated tie. The tie element represents the tie sound.
public struct Tied {
    public let type: StartStopContinue
    public let number: NumberLevel?
    public let lineType: LineType?
    public let dashedFormatting: DashedFormatting?
    public let position: Position?
    public let placement: AboveBelow?
    public let orientation: OverUnder?
    public let bezier: Bezier?
    public let color: Color?
}

extension Tied: Equatable { }
extension Tied: Decodable { }
