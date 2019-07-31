//
//  LinearArrow.swift
//  MusicXML
//
//  Created by James Bean on 7/30/19.
//

public struct LinearArrow {
    let direction: ArrowDirection
    let style: ArrowStyle?
}

extension LinearArrow: Equatable { }
extension LinearArrow: Codable { } 
