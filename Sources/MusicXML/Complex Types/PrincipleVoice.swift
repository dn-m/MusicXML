//
//  PrincipleVoice.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The principal-voice element represents principal and secondary voices in a score, either for
/// analysis or for square bracket symbols that appear in a score. The content of the
/// principal-voice element is used for analysis and may be any text value. When used for analysis
/// separate from any printed score markings, the symbol attribute should be set to "none".
public struct PrincipleVoice {
    // MARK: - Instance Properties

    public let value: String
    public let type: StartStop
    public let symbol: PrincipleVoiceSymbol
    public let printStyleAlign: PrintStyleAlign

    // MARK: - Initializers

    public init(_ value: String, type: StartStop, symbol: PrincipleVoiceSymbol, printStyleAlign: PrintStyleAlign = PrintStyleAlign()) {
        self.value = value
        self.type = type
        self.symbol = symbol
        self.printStyleAlign = printStyleAlign
    }
}

extension PrincipleVoice: Equatable {}
extension PrincipleVoice: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case symbol
        case value = ""
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(type, forKey: .type)
        try container.encode(symbol, forKey: .symbol)
        try printStyleAlign.encode(to: encoder)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        type = try container.decode(StartStop.self, forKey: .type)
        symbol = try container.decode(PrincipleVoiceSymbol.self, forKey: .symbol)
        printStyleAlign = try PrintStyleAlign(from: decoder)
    }
}

import XMLCoder
extension PrincipleVoice: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
