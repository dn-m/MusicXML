//
//  PartwiseParser.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//

/// A MusicXML document.
public struct MusicXML {

    // MARK: - Instance Properties

    /// The MusicXML.Score which is contained within a MusicXML document.
    public let score: Score

    // MARK: - Initializers

    public init(_ score: Score) {
        self.score = score
    }
}

extension MusicXML: Equatable { }
