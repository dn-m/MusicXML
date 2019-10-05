//
//  WavyLine.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// Wavy lines are one way to indicate trills. When used with a measure element, they should always
/// have type="continue" set.
public struct WavyLine {
    public let type: StartStopContinue
    public let number: Int?
    public let position: Position?
    public let placement: AboveBelow?
    public let color: Color?
    public let trillSound: TrillSound?

    public init(type: StartStopContinue, number: Int? = nil, position: Position? = nil, placement: AboveBelow? = nil, color: Color? = nil, trillSound: TrillSound? = nil) {
        self.type = type
        self.number = number
        self.position = position
        self.placement = placement
        self.color = color
        self.trillSound = trillSound
    }
}

extension WavyLine: Equatable { }
extension WavyLine: Codable { }
