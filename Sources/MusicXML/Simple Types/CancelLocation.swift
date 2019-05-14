//
//  CancelLocation.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The optional location attribute indicates where a key signature cancellation appears relative to
/// a new key signature: to the left, to the right, or before the barline and to the left. It is
/// left by default. For mid-measure key elements, a cancel location of before-barline should be
/// treated like a cancel location of left.
public enum CancelLocation: String, Decodable {
    case left = "left"
    case right = "right"
    case beforeBarline = "before-barline"
}
