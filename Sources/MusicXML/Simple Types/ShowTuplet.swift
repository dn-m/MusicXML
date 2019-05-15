//
//  ShowTuplet.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The show-tuplet type indicates whether to show a part of a tuplet relating to the tuplet-actual
/// element, both the tuplet-actual and tuplet-normal elements, or neither.
public enum ShowTuplet: String {
    case actual
    case both
    case none
}

extension ShowTuplet: Equatable { }
extension ShowTuplet: Decodable { }
