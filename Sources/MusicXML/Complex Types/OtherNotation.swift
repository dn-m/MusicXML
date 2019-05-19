//
//  OtherNotation.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The other-notation type is used to define any notations not yet in the MusicXML format. This
/// allows extended representation, though without application interoperability. It handles
/// notations where more specific extension elements such as other-dynamics and other-technical are
/// not appropriate.
public struct OtherNotation {
    public let value: String
    public let type: StartStopSingle
    public let number: NumberLevel?
    public let printObject: Bool?
    public let printStyle: PrintStyle?
    public let placement: AboveBelow?
}

extension OtherNotation: Equatable { }
extension OtherNotation: Decodable { }
