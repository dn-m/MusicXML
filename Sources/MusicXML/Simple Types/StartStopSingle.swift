//
//  StartStopSingle.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The start-stop-single type is used for an attribute of musical elements that can be used for
/// either multi-note or single-note musical elements, as for tremolos.
public enum StartStopSingle: String {
    case start
    case stop
    case single
}

extension StartStopSingle: Equatable {}
extension StartStopSingle: Codable {}
