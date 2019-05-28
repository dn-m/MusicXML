//
//  Score.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//
//  MusicXML score.mod module
//  Version 3.1
//
//  Copyright © 2004-2017 the Contributors to the MusicXML
//  Specification, published by the W3C Music Notation Community
//  Group under the W3C Community Final Specification Agreement
//  (FSA):
//
//     https://www.w3.org/community/about/agreements/final/
//
//  A human-readable summary is available:
//
//     https://www.w3.org/community/about/agreements/fsa-deed/
//
// > The score is the root element for the DTD. It includes
// > the score-header entity, followed either by a series of
// > parts with measures inside (score-partwise) or a series
// > of measures with parts inside (score-timewise). Having
// > distinct top-level elements for partwise and timewise
// > scores makes it easy to ensure that an XSLT stylesheet
// > does not try to transform a document already in the
// > desired format. The document-attributes entity includes the
// > version attribute and is defined in the common.mod file.
//
// <![ %partwise; [
// <!ELEMENT score-partwise (%score-header;, part+)>
// <!ATTLIST score-partwise
//    %document-attributes;
// >
#warning("TODO: Support Score document-attributes")
public struct Score {
    let header: Header
    let traversal: Traversal
}

extension Score: Equatable { }

extension Score: Decodable {

    // MARK: - Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.header  = try container.decode(Header.self)
        self.traversal = try container.decode(Traversal.self)
    }
}
