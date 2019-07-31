//
//  Score.Traversal.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

import XMLCoder

extension Score {

    // MARK: - Score Traversal

    /// Either a `partwise` or `timewise` traversal of a MusicXML score.
    public enum Traversal: Equatable {

        /// The `partwise` traversal of a MusicXML score.
        case partwise(Partwise)

        /// The `timewise` traversal of a MusicXML score.
        case timewise(Timewise)
    }
}

extension Score.Traversal: Codable {

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
            self = .partwise(try container.decode(Score.Partwise.self))
        } catch {
            self = .timewise(try container.decode(Score.Timewise.self))
        }
    }
}

extension Score.Traversal.CodingKeys: XMLChoiceCodingKey { }
