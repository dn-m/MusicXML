//
//  Score.Traversal.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

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

extension Score.Traversal: Decodable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case partwise = "score-partwise"
        case timewise = "score-timewise"
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
