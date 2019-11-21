//
//  Beater.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

public struct Beater {
    public let value: BeaterValue
    public let tip: TipDirection?

    public init(_ value: BeaterValue, tip: TipDirection? = nil) {
        self.value = value
        self.tip = tip
    }
}

extension Beater: Equatable {}
extension Beater: Codable {
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
