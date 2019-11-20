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
    // MARK: - Instance Properties

    // MARK: Value

    public let value: KindValue

    // MARK: Attributes

    public let useSymbols: Bool?
    public let text: String?
    public let stackDegrees: Bool?
    public let parenthesesDegrees: Bool?
    public let bracketDegrees: Bool?
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    public init(
        _ value: KindValue,
        useSymbols: Bool? = nil,
        text: String? = nil,
        stackDegrees: Bool? = nil,
        parenthesesDegrees: Bool? = nil,
        bracketDegrees: Bool? = nil,
        printStyle: PrintStyle = PrintStyle(),
        hAlign: LeftCenterRight? = nil,
        vAlign: VAlign? = nil
    ) {
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

extension Kind {
    // MARK: - Type Properties

    public static let major = Kind(.major)
    public static let minor = Kind(.minor)
    public static let augmented = Kind(.augmented)
    public static let diminished = Kind(.diminished)
    public static let dominant = Kind(.dominant)
    public static let majorSeventh = Kind(.majorSeventh)
    public static let minorSeventh = Kind(.minorSeventh)
    public static let diminishedSeventh = Kind(.diminishedSeventh)
    public static let augmentedSeventh = Kind(.augmentedSeventh)
    public static let halfDiminished = Kind(.halfDiminished)
    public static let majorMinor = Kind(.majorMinor)
    public static let majorSixth = Kind(.majorSixth)
    public static let minorSixth = Kind(.minorSixth)
    public static let dominantNinth = Kind(.dominantNinth)
    public static let majorNinth = Kind(.majorNinth)
    public static let minorNinth = Kind(.minorNinth)
    public static let dominantEleventh = Kind(.dominantEleventh)
    public static let majorEleventh = Kind(.majorEleventh)
    public static let minorEleventh = Kind(.minorEleventh)
    public static let dominantThirteenth = Kind(.dominantThirteenth)
    public static let majorThirteenth = Kind(.majorThirteenth)
    public static let minorThirteenth = Kind(.minorThirteenth)
    public static let suspendedSecond = Kind(.suspendedSecond)
    public static let suspendedFourth = Kind(.suspendedFourth)
    public static let neapolitan = Kind(.neapolitan)
    public static let italian = Kind(.italian)
    public static let french = Kind(.french)
    public static let german = Kind(.german)
    public static let pedalPointBass = Kind(.pedalPointBass)
    public static let power = Kind(.power)
    public static let tristan = Kind(.tristan)
    public static let other = Kind(.other)
    public static let none = Kind(.none)
}

extension Kind: Equatable {}
extension Kind: Codable {
    private enum CodingKeys: String, CodingKey {
        case useSymbols = "use-symbols"
        case text
        case stackDegrees = "stack-degrees"
        case parenthesesDegrees
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

import XMLCoder
extension Kind: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
