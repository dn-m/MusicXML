//
//  Offset.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// An offset is represented in terms of divisions, and indicates where the direction will appear
/// relative to the current musical location. This affects the visual appearance of the direction.
/// If an element within a direction includes a default-x attribute, the offset value will be
/// ignored when determining the appearance of that element.
public struct Offset {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let sound: Bool?

    // MARK: Value

    public let value: Divisions

    // MARK: - Initializers

    public init(_ value: Divisions, sound: Bool? = nil) {
        self.value = value
        self.sound = sound
    }
}

extension Offset: Equatable {}
extension Offset: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case value = ""
        case sound
    }
}

extension Offset: ExpressibleByIntegerLiteral {
    // MARK: - ExpressibleByIntegerLiteral

    public init(integerLiteral value: Int) {
        self.init(value)
    }
}

import XMLCoder
extension Offset: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
