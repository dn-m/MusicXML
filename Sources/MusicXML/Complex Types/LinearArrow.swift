//
//  LinearArrow.swift
//  MusicXML
//
//  Created by James Bean on 7/30/19.
//

public struct LinearArrow {
    // MARK: - Instance Properties

    let direction: ArrowDirection
    let style: ArrowStyle?

    // MARK: - Initializers

    public init(direction: ArrowDirection, style: ArrowStyle? = nil) {
        self.direction = direction
        self.style = style
    }
}

extension LinearArrow: Equatable {}
extension LinearArrow: Codable {}

import XMLCoder
extension LinearArrow: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
