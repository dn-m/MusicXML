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
    // MARK: - Instance Properties
    
    // MARK: Value
    
    public let value: GroupSymbolValue
    
    // MARK: Attributes

    public let topStaff: Int?
    public let bottomStaff: Int?
    public let color: Color?

    // MARK: Attribute Groups

    public let position: Position

    // MARK: - Initializers

    public init(_ value: GroupSymbolValue, topStaff: Int, bottomStaff: Int, position: Position, color: Color) {
        self.value = value
        self.topStaff = topStaff
        self.bottomStaff = bottomStaff
        self.position = position
        self.color = color
    }
}

extension PartSymbol: Equatable {}
extension PartSymbol: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case topStaff = "top-staff"
        case bottomStaff = "bottom-staff"
        case position
        case color
        case value = ""
    }
}

import XMLCoder
extension PartSymbol: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
