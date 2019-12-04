//
//  BarStyleColor.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bar-style-color type contains barline style and color information.
public struct BarStyleColor {
    // MARK: - Instance Properties

    // MARK: Value

    public var value: BarStyle

    // MARK: Attributes

    public var color: Color?

    // MARK: - Initializers

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

extension BarStyleColor: Equatable {}
extension BarStyleColor: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case value = ""
        case color
    }
}

import XMLCoder
extension BarStyleColor: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
