//
//  AccidentalMark.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// An accidental-mark can be used as a separate notation or as part of an ornament. When used in an
/// ornament, position and placement are relative to the ornament, not relative to the note.
public struct AccidentalMark {

    // MARK: - Value
    
    public var value: AccidentalValue

    // MARK: - Attributes

    public var placement: AboveBelow?
    public var position: Position?
    public var printStyle: PrintStyle?

    public init(value: AccidentalValue, placement: AboveBelow? = nil, position: Position? = nil, printStyle: PrintStyle? = nil) {
        self.value = value
        self.placement = placement
        self.position = position
        self.printStyle = printStyle
    }
}

extension AccidentalMark: Equatable { }
extension AccidentalMark: Codable {
    enum CodingKeys: String, CodingKey {
        case value = ""
        case position
        case placement
        case printStyle
    }
}
