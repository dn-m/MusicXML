//
//  MusicXML.String.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

extension MusicXML {
    /// The string type is used with tablature notation, regular notation (where it is often
    /// circled), and chord diagrams. String numbers start with 1 for the highest string.
    public struct String {
        public let value: StringNumber
        public let printStyle: PrintStyle?
        public let placement: AboveBelow?
    }
}

extension MusicXML.String: Equatable { }
extension MusicXML.String: Decodable { }
