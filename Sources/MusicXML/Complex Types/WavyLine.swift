//
//  WavyLine.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// Wavy lines are one way to indicate trills. When used with a measure element, they should always
/// have type="continue" set.
public struct WavyLine {
    public var type: StartStopContinue
    public var number: Int?
    public var position: Position?
    public var placement: AboveBelow?
    public var color: Color?
    public var trillSound: TrillSound?
}

extension WavyLine: Equatable { }
extension WavyLine: Codable { }
