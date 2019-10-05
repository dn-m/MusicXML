//
//  Instrument.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The instrument type distinguishes between score-instrument elements in a score-part. The id
/// attribute is an IDREF back to the score-instrument ID. If multiple score-instruments are
/// specified on a score-part, there should be an instrument element for each note in the part.
public struct Instrument {
    public let id: String

    public init(id: String) {
        self.id = id
    }
}

extension Instrument: Equatable { }
extension Instrument: Codable { }
