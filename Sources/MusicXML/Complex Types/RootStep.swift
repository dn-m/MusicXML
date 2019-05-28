//
//  RootStep.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The root-step type represents the pitch step of the root of the current chord within the harmony
/// element.
public struct RootStep {
    public let value: Step
    public let text: String
    public let printStyle: PrintStyle
}

extension RootStep: Equatable { }
extension RootStep: Decodable { }
