//
//  MeasureLayout.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The measure-layout type includes the horizontal distance from the previous measure.
public struct MeasureLayout {
    // MARK: - Instance Properties

    /// The measure-distance element specifies the horizontal distance from the previous measure.
    /// This value is only used for systems where there is horizontal whitespace in the middle of a
    /// system, as in systems with codas. To specify the measure width, use the width attribute of
    /// the measure element.
    public let measureDistance: Tenths?

    public init(measureDistance: Tenths? = nil) {
        self.measureDistance = measureDistance
    }
}

extension MeasureLayout: Equatable {}
extension MeasureLayout: Codable {}
