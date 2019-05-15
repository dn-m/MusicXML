//
//  YesNoNumber.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The yes-no-number type is used for attributes that can be either boolean or numeric values.
public enum YesNoNumber {
    case yes
    case no
    case number(Double)
}

extension YesNoNumber: Equatable { }
extension YesNoNumber: Decodable {
    #warning("TODO: Implement YesNoNumber: Decodable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("YesNoNumber.init(from: Decoder) not yet implemented!")
    }
}
