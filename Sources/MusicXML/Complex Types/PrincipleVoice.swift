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
    public let value: String
    public let type: StartStop
    public let symbol: PrincipleVoiceSymbol
    public let printStyleAlign: PrintStyleAlign?

    public init(value: String, type: StartStop, symbol: PrincipleVoiceSymbol, printStyleAlign: PrintStyleAlign? = nil) {
        self.value = value
        self.type = type
        self.symbol = symbol
        self.printStyleAlign = printStyleAlign
    }
}

extension PrincipleVoice: Equatable { }
extension PrincipleVoice: Codable { }
