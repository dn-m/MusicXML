///
///  Score.swift
///  MusicXML
///
///  Created by James Bean on 12/3/18.
///
///  MusicXML score.mod module
///  Version 3.1
///
///  Copyright © 2004-2017 the Contributors to the MusicXML
///  Specification, published by the W3C Music Notation Community
///  Group under the W3C Community Final Specification Agreement
///  (FSA):
///
///     https://www.w3.org/community/about/agreements/final/
///
///  A human-readable summary is available:
///
///     https://www.w3.org/community/about/agreements/fsa-deed/
///

/// Either a `partwise` or `timewise` traversal of a MusicXML score.
public enum Score: Equatable {
    /// The `partwise` traversal of a MusicXML score.
    case partwise(Partwise)

    /// The `timewise` traversal of a MusicXML score.
    case timewise(Timewise)
    
    func parsedObject() -> Any? {
        switch self {
        case .partwise(let partwise):
             return partwise
        case .timewise(let timewise):
            return timewise
        }
    }
}

extension Score: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case partwise = "score-partwise"
        case timewise = "score-timewise"
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .partwise(value):
            try container.encode(value, forKey: .partwise)
        case let .timewise(value):
            try container.encode(value, forKey: .timewise)
        }
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let codingKey = decoder.userInfo[CodingUserInfoKey(rawValue: Score.topLevelTagKey)!] as? CodingKeys {
            switch codingKey {
            case .partwise:
                self = .partwise(try container.decode(Partwise.self))
            case .timewise:
                self = .timewise(try container.decode(Timewise.self))
            }
        } else {
            // Fall back to try each top level tag
            do {
                self = .partwise(try container.decode(Partwise.self))
            } catch {
                self = .timewise(try container.decode(Timewise.self))
            }
        }
    }
}
