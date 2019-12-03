//
//  Grace.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The grace type indicates the presence of a grace note. The other grace note attributes come from
/// MuseData sound suggestions.
public struct Grace {
    // MARK: - Instance Properties

    public let stealTimePrevious: Int?
    public let stealTimeFollowing: Int?
    public let makeTime: Divisions?
    public let slash: Bool?

    // MARK: - Initializers

    public init(stealTimePrevious: Int? = nil, stealTimeFollowing: Int? = nil, makeTime: Divisions? = nil, slash: Bool? = nil) {
        self.stealTimePrevious = stealTimePrevious
        self.stealTimeFollowing = stealTimeFollowing
        self.makeTime = makeTime
        self.slash = slash
    }
}

extension Grace: Equatable {}
extension Grace: Codable {}
