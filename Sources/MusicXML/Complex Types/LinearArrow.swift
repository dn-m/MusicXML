//
//  LinearArrow.swift
//  MusicXML
//
//  Created by James Bean on 7/30/19.
//

public struct LinearArrow {
    let direction: ArrowDirection
    let style: ArrowStyle?

    public init(direction: ArrowDirection, style: ArrowStyle? = nil) {
        self.direction = direction
        self.style = style
    }
}

extension LinearArrow: Equatable { }
extension LinearArrow: Codable { } 
