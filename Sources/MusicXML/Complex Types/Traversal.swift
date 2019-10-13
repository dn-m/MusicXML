//
//  Traversal.swift
//  MusicXML
//
//  Created by James Bean on 8/5/19.
//

import XMLCoder

/// Either a `partwise` or `timewise` traversal of a MusicXML score.
public enum Traversal: Equatable {

    /// The `partwise` traversal of a MusicXML score.
    case partwise(Partwise)

    /// The `timewise` traversal of a MusicXML score.
    case timewise(Timewise)
}

extension Traversal: Codable {

    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case partwise = "score-partwise"
        case timewise = "score-timewise"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .partwise(value):
            try container.encode(value, forKey: .partwise)
        case let .timewise(value):
            try container.encode(value, forKey: .timewise)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self = .partwise(try container.decode(Partwise.self))
        } catch {
            self = .timewise(try container.decode(Timewise.self))
        }
    }
}
