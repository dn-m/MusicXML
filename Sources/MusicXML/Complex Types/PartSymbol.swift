//
//  PartSymbol.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The part-symbol type indicates how a symbol for a multi-staff part is indicated in the score;
/// brace is the default value. The top-staff and bottom-staff elements are used when the brace does
/// not extend across the entire part. For example, in a 3-staff organ part, the top-staff will
/// typically be 1 for the right hand, while the bottom-staff will typically be 2 for the left hand.
/// Staff 3 for the pedals is usually outside the brace.
public struct PartSymbol {
    let value: GroupSymbolValue
    let kind: Kind
    let topStaff: Int
    let bottomStaff: Int
    let position: Position
    let color: Color

    public init(_ value: GroupSymbolValue, kind: Kind, topStaff: Int, bottomStaff: Int, position: Position, color: Color) {
        self.value = value
        self.kind = kind
        self.topStaff = topStaff
        self.bottomStaff = bottomStaff
        self.position = position
        self.color = color
    }
}

extension PartSymbol: Equatable { }
extension PartSymbol: Codable {
    // sourcery:inline:PartSymbol.ExplicitCodingKey
    enum CodingKeys: String, CodingKey {
        case kind
        case topStaff
        case bottomStaff
        case position
        case color
        case value = ""
    }
    // sourcery:end
}
