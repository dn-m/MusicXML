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
    public let value: KindValue
    public let useSymbols: Bool?
    public let text: String?
    public let stackDegrees: Bool?
    public let parenthesesDegrees: Bool?
    public let bracketDegrees: Bool?
    public let printStyle: PrintStyle?
    public let horizontalAlignment: LeftCenterRight?
    public let verticalAlignment: VAlign?

    public init(value: KindValue, useSymbols: Bool? = nil, text: String? = nil, stackDegrees: Bool? = nil, parenthesesDegrees: Bool? = nil, bracketDegrees: Bool? = nil, printStyle: PrintStyle? = nil, horizontalAlignment: LeftCenterRight? = nil, verticalAlignment: VAlign? = nil) {
        self.value = value
        self.useSymbols = useSymbols
        self.text = text
        self.stackDegrees = stackDegrees
        self.parenthesesDegrees = parenthesesDegrees
        self.bracketDegrees = bracketDegrees
        self.printStyle = printStyle
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
    }
}

extension Kind: Equatable { }
extension Kind: Codable { }
