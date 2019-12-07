//
//  MeasureAttributes.swift
//  MusicXML
//
//  Created by James Bean on 10/15/19.
//

/// The attributes which are shared between the `Timewise` and `Partwise` forms of `Measure`.
public struct MeasureAttributes {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let number: String
    public let text: String?
    public let implicit: Bool?
    public let nonControlling: Bool?
    public let width: Tenths?
    public let optionalUniqueID: Int?
}

extension MeasureAttributes: Equatable {}
extension MeasureAttributes: Hashable {}

extension MeasureAttributes: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case number
        case text
        case implicit
        case nonControlling = "non-controlling"
        case width
        case optionalUniqueID = "optional-unique-id"
    }
}

import XMLCoder
extension MeasureAttributes: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number, CodingKeys.text, CodingKeys.implicit, CodingKeys.nonControlling, CodingKeys.width, CodingKeys.optionalUniqueID:
            return .attribute
        default:
            return .element
        }
    }
}
