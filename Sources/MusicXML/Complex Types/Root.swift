//
//  Root.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The root type indicates a pitch like C, D, E vs. a function indication like I, II, III. It is
/// used with chord symbols in popular music. The root element has a root-step and optional
/// root-alter element similar to the step and alter elements, but renamed to distinguish the
/// different musical meanings.
public struct Root {
    public let step: RootStep
    public let alter: RootAlter?
}

extension Root: Equatable { }
extension Root: Decodable { }
