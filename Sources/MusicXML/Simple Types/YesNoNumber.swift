//
//  YesNoNumber.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

import XMLCoder

/// The yes-no-number type is used for attributes that can be either boolean or numeric values.
public enum YesNoNumber {
    case yes
    case no
    case number(Double)
}

extension YesNoNumber: Equatable { }
extension YesNoNumber: Codable {
    enum CodingKeys: String, CodingKey { case yes, no, number }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.yes) {
            self = .yes
            return
        }
        if container.contains(.no) {
            self = .no
            return
        }
        self = .number(try container.decode(Double.self, forKey: .number))
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .yes:
            try container.encode(Optional<Double>.none, forKey: .yes)
        case .no:
            try container.encode(Optional<Double>.none, forKey: .no)
        case let .number(number):
            try container.encode(number, forKey: .number)
        }
    }
}

extension YesNoNumber.CodingKeys: XMLChoiceCodingKey {}
