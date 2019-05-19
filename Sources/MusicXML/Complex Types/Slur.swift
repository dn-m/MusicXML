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
    public let number: NumberLevel?
    public let lineType: LineType?
    public let dashedFormatting: DashedFormatting?
    public let position: Position?
    public let placement: AboveBelow?
    public let orientation: OverUnder?
    public let bezier: Bezier?
    public let color: Color?
}

extension Slur: Equatable { }
extension Slur: Decodable { }
