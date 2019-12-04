//
//  Beater.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

public struct Beater {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: BeaterValue

    // MARK: Attributes

    public let tip: TipDirection?

    // MARK: - Initializers

    public init(_ value: BeaterValue, tip: TipDirection? = nil) {
        self.value = value
        self.tip = tip
    }
}

extension Beater: Equatable {}
extension Beater: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case tip
        case value = ""
    }
}

import XMLCoder
extension Beater: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
