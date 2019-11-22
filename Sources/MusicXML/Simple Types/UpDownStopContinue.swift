//
//  UpDownStopContinue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The up-down-stop-continue type is used for octave-shift elements, indicating the direction of
/// the shift from their true pitched values because of printing difficulty.
public enum UpDownStopContinue: String {
    case up
    case down
    case stop
    case `continue`
}

extension UpDownStopContinue: Equatable {}
extension UpDownStopContinue: Codable {}
