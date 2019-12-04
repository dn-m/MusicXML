//
//  Rights.swift
//  MusicXML
//
//  Created by James Bean on 8/9/19.
//

import XMLCoder

public struct Rights {
    // MARK: - Instance Properties

    // MARK: Attributes

    public var type: String?

    // MARK: Value

    public var value: String

    // MARK: - Initializers

    public init(_ value: String, type: String? = nil) {
        self.value = value
        self.type = type
    }
}

extension Rights: Equatable {}

extension Rights: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case value = ""
        case type
    }
}

extension Rights: DynamicNodeDecoding {
    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
            return .element
        }
    }
}

extension Rights: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.type:
            return .attribute
        default:
            return .element
        }
    }
}
