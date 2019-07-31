//
//  TextFontColor.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The text-font-color type represents text with optional font and color information. It is used
/// for the elision element.
public struct TextFontColor {
    public let value: String
    public let font: Font?
    public let color: Color?
    public let textDecoration: TextDecoration?
    public let textRotation: Double?
    public let letterSpacing: NumberOrNormal?
    public let dir: TextDirection?
}

extension TextFontColor: Equatable { }
extension TextFontColor: Codable { }
