//
//  StartStopChangeContinue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The start-stop-change-continue type is used to distinguish types of pedal directions.
public enum StartStopChangeContinue: String {
    case start
    case stop
    case change
    case `continue`
}

extension StartStopChangeContinue: Equatable {}
extension StartStopChangeContinue: Codable {}
