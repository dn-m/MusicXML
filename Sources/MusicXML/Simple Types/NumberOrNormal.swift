//
//  NumberOrNormal.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

import XMLCoder

/// The number-or-normal values can be either a decimal number or the string "normal". This is used
/// by the line-height and letter-spacing attributes.
public enum NumberOrNormal {
    case number(Double)
    case normal
}

extension NumberOrNormal: Equatable { }

extension NumberOrNormal: Codable {
    enum CodingKeys: String, CodingKey { case number, normal }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.normal) {
            self = .normal
            return
        }
        self = .number(try container.decode(Double.self, forKey: .number))
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .normal:
            try container.encode(Optional<Double>.none, forKey: .normal)
        case let .number(number):
            try container.encode(number, forKey: .number)
        }
    }
}

extension NumberOrNormal.CodingKeys: XMLChoiceCodingKey {}
