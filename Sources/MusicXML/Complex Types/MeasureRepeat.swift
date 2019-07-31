//
//  MeasureRepeat.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The measure-repeat type is used for both single and multiple measure repeats. The text of the
/// element indicates the number of measures to be repeated in a single pattern. Both the start and
/// the stop of the measure-repeat must be specified. The text of the element is ignored when the
/// type is stop. The measure-repeat element specifies a notation style for repetitions. The actual
/// music being repeated needs to be repeated within the MusicXML file. This element specifies the
/// notation that indicates the repeat.
public struct MeasureRepeat {
    public let type: StartStop
    public let slashes: Int
}

extension MeasureRepeat: Equatable { }
extension MeasureRepeat: Codable { }
