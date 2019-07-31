//
//  YesNo.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The yes-no type is used for boolean-like attributes. We cannot use W3C XML Schema booleans due
/// to their restrictions on expression of boolean values.
public enum YesNo: String {
    case yes
    case no
}

extension YesNo: Equatable { }
extension YesNo: Codable { }
