//
//  StrongAccent.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The strong-accent type indicates a vertical accent mark.
public struct StrongAccent {
    public let type: UpDown
    public let position: Position
    public let printStyle: PrintStyle
    public let placement: AboveBelow

    public init(type: UpDown, position: Position, printStyle: PrintStyle, placement: AboveBelow) {
        self.type = type
        self.position = position
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension StrongAccent: Equatable { }
extension StrongAccent: Codable { }
