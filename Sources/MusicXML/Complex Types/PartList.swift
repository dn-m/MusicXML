//
//  PartList.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

import XMLCoder

/// The part-list identifies the different musical parts in this movement. Each part has an ID that
/// is used later within the musical data. Since parts may be encoded separately and combined later,
/// identification elements are present at both the score and score-part levels. There must be at
/// least one score-part, combined as desired with part-group elements that indicate braces and
/// brackets. Parts are ordered from top to bottom in a score based on the order in which they
/// appear in the part-list.
public struct PartList {
    public let parts: [Item]
}

extension PartList {
    public enum Item {
        case group(PartGroup)
        case part(ScorePart)
    }
}

extension PartList.Item: Equatable { }
extension PartList.Item: Codable {
    enum CodingKeys: String, CodingKey {
        case group = "part-group"
        case part = "score-part"
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .group(value):
            try container.encode(value, forKey: .group)
        case let .part(value):
            try container.encode(value, forKey: .part)
        }
    }
    public init(from decoder: Decoder) throws {
        let keyed = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .group(try keyed.decode(PartGroup.self, forKey: .group))
        } catch {
            self = .part(try keyed.decode(ScorePart.self, forKey: .part))
        }
    }
}

extension PartList.Item.CodingKeys: XMLChoiceCodingKey { }

extension PartList: Equatable { }
extension PartList: Codable {

    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case parts = "score-part"
    }
}
