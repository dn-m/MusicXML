//
//  GroupBarline.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The group-barline type indicates if the group should have common barlines.
public struct GroupBarline {
    // MARK: - Instance Properties

    // MARK: Attributes

    public var color: Color?

    // MARK: Value

    public var value: GroupBarlineValue

    // MARK: - Initializers

    public init(_ value: GroupBarlineValue, color: Color? = nil) {
        self.value = value
        self.color = color
    }
}

extension GroupBarline: Equatable {}
extension GroupBarline: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case value = ""
        case color
    }
}

import XMLCoder
extension GroupBarline: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
