//
//  Kind.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// Kind indicates the type of chord. Degree elements can then add, subtract, or alter from these
/// starting points. Since the kind element is the constant in all the harmony-chord groups that can
/// make up a polychord, many formatting attributes are here. The alignment attributes are for the
/// entire harmony-chord group of which this kind element is a part.
public struct Kind {
    public let useSymbols: Bool?
    public let text: String?
    public let stackDegrees: Bool?
    public let parenthesesDegrees: Bool?
    public let bracketDegrees: Bool?
    public let printStyle: PrintStyle
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?

    public let value: KindValue

    public init(useSymbols: Bool? = nil, text: String? = nil, stackDegrees: Bool? = nil, parenthesesDegrees: Bool? = nil, bracketDegrees: Bool? = nil, printStyle: PrintStyle = PrintStyle(), hAlign: LeftCenterRight? = nil, vAlign: VAlign? = nil, value: KindValue) {
        self.useSymbols = useSymbols
        self.text = text
        self.stackDegrees = stackDegrees
        self.parenthesesDegrees = parenthesesDegrees
        self.bracketDegrees = bracketDegrees
        self.printStyle = printStyle
        self.hAlign = hAlign
        self.vAlign = vAlign
        self.value = value
    }
}

extension Kind: Equatable {}
extension Kind: Codable {
    private enum CodingKeys: String, CodingKey {
        case useSymbols = "use-symbols"
        case text
        case stackDegrees = "stack-degrees"
        case parenthesesDegrees = "parenthesesDegrees"
        case bracketDegrees = "bracket-degrees"
        case hAlign = "halign"
        case vAlign = "valign"
        case value = ""
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.useSymbols = try container.decodeIfPresent(Bool.self, forKey: .useSymbols)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.stackDegrees = try container.decodeIfPresent(Bool.self, forKey: .stackDegrees)
        self.parenthesesDegrees = try container.decodeIfPresent(Bool.self, forKey: .parenthesesDegrees)
        self.bracketDegrees = try container.decodeIfPresent(Bool.self, forKey: .bracketDegrees)
        self.printStyle = try PrintStyle(from: decoder)
        self.hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
        self.vAlign = try container.decodeIfPresent(VAlign.self, forKey: .vAlign)
        self.value = try container.decode(KindValue.self, forKey: .value)
    }
}
