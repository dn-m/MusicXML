//
//  Creator.swift
//  MusicXML
//
//  Created by James Bean on 8/9/19.
//

import XMLCoder

public struct Creator {
    // MARK: Value

    public var value: String

    // MARK: - Attribtues

    public var type: String?

    // MARK: - Initializers

    public init(_ value: String, type: String? = nil) {
        self.value = value
        self.type = type
    }
}

extension Creator: Equatable {}

extension Creator: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case type
    }
}

extension Creator: DynamicNodeDecoding {
    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
            return .element
        }
    }
}

extension Creator: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
            return .element
        }
    }
}
