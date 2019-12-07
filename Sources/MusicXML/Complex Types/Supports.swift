//
//  Supports.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The supports type indicates if a MusicXML encoding supports a particular MusicXML element. This
/// is recommended for elements like beam, stem, and accidental, where the absence of an element is
/// ambiguous if you do not know if the encoding supports that element. For Version 2.0, the
/// supports element is expanded to allow programs to indicate support for particular attributes or
/// particular values. This lets applications communicate, for example, that all system and/or page
/// breaks are contained in the MusicXML file.
public struct Supports {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let attribute: String?
    public let element: String
    public let type: Bool
    public let value: String?

    // MARK: - Initializers

    public init(attribute: String? = nil, element: String, type: Bool, value: String? = nil) {
        self.attribute = attribute
        self.element = element
        self.type = type
        self.value = value
    }
}

extension Supports: Equatable {}
extension Supports: Codable {}

import XMLCoder
extension Supports: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.attribute:
            return .attribute
        case CodingKeys.element:
            return .attribute
        case CodingKeys.type:
            return .attribute
        case CodingKeys.value:
            return .attribute
        default:
        return .element
        }
    }
}
