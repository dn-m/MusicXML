//
//  PrintStyle.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

public protocol _PrintStyle: _Position {
    var font: Font? { get }
    var color: Color? { get }
}

/// The print-style attribute group collects the most popular combination of printing attributes:
/// position, font, and color.
public struct PrintStyle {
    public let position: Position
    public let font: Font
    public let color: Color
}

extension PrintStyle: Equatable { }
extension PrintStyle: Codable { }