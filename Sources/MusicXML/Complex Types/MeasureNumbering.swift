//
//  MeasureNumbering.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The measure-numbering type describes how frequently measure numbers are displayed on this part.
/// The number attribute from the measure element is used for printing.
public struct MeasureNumbering {
    public let value: MeasureNumberingValue
    public let printStyleAlign: PrintStyleAlign?
}

extension MeasureNumbering: Equatable { }
extension MeasureNumbering: Codable { }
