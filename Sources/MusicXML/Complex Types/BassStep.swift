//
//  BassStep.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bass-step type represents the pitch step of the bass of the current chord within the harmony
/// element. In some chord styles, the text for the bass-step element may include bass-alter
/// information. In that case, the print-object attribute of the bass-alter element can be set to
/// no.
public struct BassStep {
    public let value: Step
    /// The text attribute indicates how the bass should appear in a score if not using the element
    /// contents.
    public let text: String?
    public let printStyle: PrintStyle?

    public init(value: Step, text: String? = nil, printStyle: PrintStyle? = nil) {
        self.value = value
        self.text = text
        self.printStyle = printStyle
    }
}

extension BassStep: Equatable { }
extension BassStep: Codable { }
