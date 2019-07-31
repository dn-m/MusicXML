//
//  DegreeType.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The degree-type type indicates if this degree is an addition, alteration, or subtraction
/// relative to the kind of the current chord. The value of the degree-type element affects the
/// interpretation of the value of the degree-alter element. The text attribute specifies how the
/// type of the degree should be displayed in a score.
public struct DegreeType {
    let value: DegreeTypeValue
    let text: String?
    let printStyle: PrintStyle?
}

extension DegreeType: Equatable { }
extension DegreeType: Codable { }
