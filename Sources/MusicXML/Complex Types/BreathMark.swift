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

    public init(value: BreathMarkValue, position: Position, printStyle: PrintStyle, placement: AboveBelow) {
        self.value = value
        self.position = position
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension BreathMark: Equatable { }
extension BreathMark: Codable { }
