//
//  Arrow.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

import XMLCoder

/// The arrow element represents an arrow used for a musical technical indication.
public struct Arrow {
    public enum Kind {
        case circular(CircularArrow)
        case linear(LinearArrow)
    }
    public let kind: Kind
    public let position: Position
    public let printStyle: PrintStyle
    public let placement: AboveBelow?
}

extension Arrow.Kind: Equatable { }

extension Arrow.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case circular
        case linear
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .circular(value):
            try container.encode(value, forKey: .circular)
        case let .linear(value):
            try container.encode(value, forKey: .linear)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .circular(try container.decode(CircularArrow.self, forKey: .circular))
        } catch {
            self = .linear(try container.decode(LinearArrow.self, forKey: .linear))
        }
    }
}

extension Arrow.Kind.CodingKeys: XMLChoiceCodingKey {}

extension Arrow: Equatable { }
extension Arrow: Codable { }
