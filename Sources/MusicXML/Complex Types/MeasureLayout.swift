//
//  MeasureLayout.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The measure-layout type includes the horizontal distance from the previous measure.
public struct MeasureLayout {
    // MARK: - Instance Properties

    // MARK: Attributes

    /// The measure-distance element specifies the horizontal distance from the previous measure.
    /// This value is only used for systems where there is horizontal whitespace in the middle of a
    /// system, as in systems with codas. To specify the measure width, use the width attribute of
    /// the measure element.
    public let measureDistance: Tenths?

    // MARK: - Initializers

    public init(measureDistance: Tenths? = nil) {
        self.measureDistance = measureDistance
    }
}

extension MeasureLayout: Equatable {}
extension MeasureLayout: Codable {}

import XMLCoder
extension MeasureLayout: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.measureDistance:
            return .attribute
        default:
        return .element
        }
    }
}
