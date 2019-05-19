//
//  Dynamics.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Dynamics can be associated either with a note or a general musical direction. To avoid
/// inconsistencies between and amongst the letter abbreviations for dynamics (what is sf vs. sfz,
/// standing alone or with a trailing dynamic that is not always piano), we use the actual letters
/// as the names of these dynamic elements. The other-dynamics element allows other dynamic marks
/// that are not covered here, but many of those should perhaps be included in a more general
/// musical direction element. Dynamics elements may also be combined to create marks not covered by
/// a single element, such as sfmp. These letter dynamic symbols are separated from crescendo,
/// decrescendo, and wedge indications. Dynamic representation is inconsistent in scores. Many
/// things are assumed by the composer and left out, such as returns to original dynamics.
/// Systematic representations are quite complex: for example, Humdrum has at least 3 representation
/// formats related to dynamics. The MusicXML format captures what is in the score, but does not
/// try to be optimal for analysis or synthesis of dynamics.
public struct Dynamics {
    public let values: [Dynamic]
    public let printStyleAlign: PrintStyleAlign?
    public let placement: Placement?
    public let textDecoration: TextDecoration?
    public let enclosure: Enclosure?
}


extension Dynamics: Equatable { }
extension Dynamics: Decodable { }
