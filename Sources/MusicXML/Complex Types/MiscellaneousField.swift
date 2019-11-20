//
//  MiscellaneousField.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

import XMLCoder

/// If a program has other metadata not yet supported in the MusicXML format, each type of metadata
/// can go in a miscellaneous-field element. The required name attribute indicates the type of
/// metadata the element content represents.
public struct MiscellaneousField {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let name: String

    // MARK: Value

    public let value: String

    // MARK: - Initializers

    public init(_ value: String, name: String) {
        self.name = name
        self.value = value
    }
}

extension MiscellaneousField: Equatable {}
extension MiscellaneousField: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case value = ""
    }
}

extension MiscellaneousField: DynamicNodeDecoding {
    public static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        if key.stringValue == CodingKeys.name.stringValue {
            return .attribute
        } else {
            return .elementOrAttribute
        }
    }
}

extension MiscellaneousField: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.name:
            return .attribute
        case CodingKeys.value:
            return .element
        default:
            return .element
        }
    }
}
