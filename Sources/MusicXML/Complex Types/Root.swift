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

    public init(step: RootStep, alter: RootAlter? = nil) {
        self.step = step
        self.alter = alter
    }
}

extension Root: Equatable { }
extension Root: Codable {
    enum CodingKeys: String, CodingKey {
        case step = "root-step"
        case alter = "root-alter"
    }
}
