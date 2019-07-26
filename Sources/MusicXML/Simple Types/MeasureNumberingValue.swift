//
//  MeasureNumberingValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The measure-numbering-value type describes how measure numbers are displayed on this part: no
/// numbers, numbers every measure, or numbers every system.
public enum MeasureNumberingValue: String {
    case none
    case measure
    case system
}

extension MeasureNumberingValue: Equatable { }
extension MeasureNumberingValue: Codable { }
