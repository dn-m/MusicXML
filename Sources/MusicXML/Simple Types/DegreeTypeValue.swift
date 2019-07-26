//
//  DegreeTypeValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The degree-type-value type indicates whether the current degree element is an addition,
/// alteration, or subtraction to the kind of the current chord in the harmony element.
public enum DegreeTypeValue: String {
    /// If the degree element is in addition to the kind of the current chord.
    case add
    /// If the degree element is an alteration to the kind of the current chord.
    case alter
    /// If the degree element is a subtraction from the kind of the current chord.
    case subtract
}

extension DegreeTypeValue: Equatable { }
extension DegreeTypeValue: Codable { }
