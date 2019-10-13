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

    public init(_ value: BarStyle, color: Color? = nil) {
        self.value = value
        self.color = color
    }
}

extension BarStyleColor {

    // MARK: - Type Properties

    public static let regular = BarStyleColor(.regular)
    public static let dotted = BarStyleColor(.dotted)
    public static let dashed = BarStyleColor(.dashed)
    public static let heavy = BarStyleColor(.heavy)
    public static let lightLight = BarStyleColor(.lightLight)
    public static let lightHeavy = BarStyleColor(.lightHeavy)
    public static let heavyLight = BarStyleColor(.heavyLight)
    public static let heavyHeavy = BarStyleColor(.heavyHeavy)
    public static let tick = BarStyleColor(.tick)
    public static let short = BarStyleColor(.short)
    public static let none = BarStyleColor(.none)
}

extension BarStyleColor: Equatable { }
extension BarStyleColor: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case color
    }
}
