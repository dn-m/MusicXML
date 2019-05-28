//
//  Link.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//

// MusicXML link.mod module
// Version 3.1
//
// Copyright © 2004-2017 the Contributors to the MusicXML
// Specification, published by the W3C Music Notation Community
// Group under the W3C Community Final Specification Agreement
// (FSA):
//
//    https://www.w3.org/community/about/agreements/final/
//
// A human-readable summary is available:
//
//    https://www.w3.org/community/about/agreements/fsa-deed/
//
//    This DTD module describes the entity and elements used for
//    simple XLink support. The link element serves as an outgoing
//    XLink. The bookmark element serves as a well-defined target
//    for an incoming XLink. The entity for link-attributes is
//    also used to connect a MusicXML score with a MusicXML opus.
//    If a relative link is used within a document that is part of
//    a compressed MusicXML file, the link is relative to the
//    root folder of the zip file.
//

/// The link type serves as an outgoing simple XLink. It is also used to connect a MusicXML score
/// with a MusicXML opus. If a relative link is used within a document that is part of a compressed
/// MusicXML file, the link is relative to the root folder of the zip file.
public struct Link {

    public let name: String?

    // > The element attribute specifies an
    // > element type for a descendant of the next sibling element
    // > that is not a link or bookmark.
    public let element: String?

    // The position attribute
    //    specifies the position of this descendant element, where
    //    the first position is 1. The position attribute is ignored
    //    if the element attribute is not present. For instance, an
    //    element value of "beam"  and a position value of "2" defines
    //    the link or bookmark to refer to the second beam descendant
    //    of the next sibling element that is not a link or bookmark.
    //    This is equivalent to an XPath test of [.//beam[2]] done
    //    in the context of the sibling element.
    public let position: String?
}

extension Link: Equatable { }
extension Link: Decodable { }
