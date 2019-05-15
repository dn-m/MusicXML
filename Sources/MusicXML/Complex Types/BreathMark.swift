//
//  BreathMark.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The breath-mark element indicates a place to take a breath.
public struct BreathMark {
    public let value: BreathMarkValue
    public let position: Position
    public let printStyle: PrintStyle
    public let placement: AboveBelow
}
