//
//  NoteheadValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The notehead type indicates shapes other than the open and closed ovals associated with note
/// durations. The values do, re, mi, fa, fa up, so, la, and ti correspond to Aikin's 7-shape
/// system. The fa up shape is typically used with upstems; the fa shape is typically used with
/// downstems or no stems.  The arrow shapes differ from triangle and inverted triangle by being
/// centered on the stem. Slashed and back slashed notes include both the normal notehead and a
/// slash. The triangle shape has the tip of the triangle pointing up; the inverted triangle shape
/// has the tip of the triangle pointing down. The left triangle shape is a right triangle with the
/// hypotenuse facing up and to the left.
public enum NoteheadValue: String {
    case slash
    case triangle
    case diamond
    case square
    case cross
    case x
    case circleX = "circle-x"
    case invertedTriangle = "inverted triangle"
    case arrowDown = "arrow down"
    case arrowUp = "arrow up"
    case circled
    case slashed
    case backSlashed = "back slashed"
    case normal
    case cluster
    case circleDot = "circle dot"
    case leftTriangle = "left triangle"
    case rectangle
    case other
    case none
    case `do`
    case re
    case mi
    case fa
    case faUp = "fa up"
    case so
    case la
    case ti
}

extension NoteheadValue: Equatable { }
extension NoteheadValue: Codable { }
