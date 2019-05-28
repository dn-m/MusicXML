//
//  NumberOrNormal.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The number-or-normal values can be either a decimal number or the string "normal". This is used
/// by the line-height and letter-spacing attributes.
public enum NumberOrNormal {
    case number(Double)
    case normal
}

extension NumberOrNormal: Equatable { }

extension NumberOrNormal: Decodable {
    #warning("TODO: Implement NumberOrNormal: Decodable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("NumberOrNormal.init(from: Decoder) not yet implemented!")
    }
}

