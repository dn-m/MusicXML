//
//  FirstFret.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The first-fret type indicates which fret is shown in the top space of the frame; it is fret 1 if
/// the element is not present.
public struct FirstFret {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: Int

    // MARK: Attributes

    public let text: String?
    public let location: LeftRight?

    // MARK: - Initializers

    public init(_ value: Int, text: String? = nil, location: LeftRight? = nil) {
        self.value = value
        self.text = text
        self.location = location
    }
}

extension FirstFret: Equatable {}
extension FirstFret: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case text
        case location
        case value = ""
    }
}

import XMLCoder
extension FirstFret: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
