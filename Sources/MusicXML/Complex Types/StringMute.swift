//
//  StringMute.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The string-mute type represents string mute on and mute off symbols.
public struct StringMute {
    // MARK: - Instance Properties

    public let type: OnOff
    public let printStyleAlign: PrintStyleAlign

    public init(type: OnOff, printStyleAlign: PrintStyleAlign = PrintStyleAlign()) {
        self.type = type
        self.printStyleAlign = printStyleAlign
    }
}

extension StringMute: Equatable {}
extension StringMute: Codable {
    enum CodingKeys: String, CodingKey {
        case type
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try printStyleAlign.encode(to: encoder)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(OnOff.self, forKey: .type)
        printStyleAlign = try PrintStyleAlign(from: decoder)
    }
}
