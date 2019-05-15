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
    public let number: NumberLevel
    public let position: Position
    public let placement: Placement
    public let color: Color
    public let trillSound: TrillSound
}

extension WavyLine: Equatable { }
extension WavyLine: Decodable { }
