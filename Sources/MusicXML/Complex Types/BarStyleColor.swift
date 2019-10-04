//
//  BarStyleColor.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bar-style-color type contains barline style and color information.
public struct BarStyleColor {
    public var value: BarStyle
    public var color: Color?

    public init(value: BarStyle, color: Color? = nil) {
        self.value = value
        self.color = color
    }
}

extension BarStyleColor: Equatable { }
extension BarStyleColor: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case color
    }
}
