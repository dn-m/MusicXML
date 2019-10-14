//
//  Tie.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tie element indicates that a tie begins or ends with this note. The tie element indicates
/// sound; the tied element indicates notation.
public struct Tie {

    public var type: StartStop
    public var timeOnly: TimeOnly?

    public init(_ type: StartStop, timeOnly: TimeOnly? = nil) {
        self.type = type
        self.timeOnly = timeOnly
    }
}

extension Tie {

    // MARK: Type Properties

    public static let start = Tie(.start)
    public static let stop = Tie(.stop)
}

extension Tie: Equatable { }
extension Tie: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case timeOnly = "time-only"
    }
}
