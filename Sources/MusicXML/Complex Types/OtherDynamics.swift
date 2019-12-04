//
//  OtherDynamics.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

public struct OtherDynamics {
    // MARK: - Instance Properties

    public let smufl: SMuFL

    // MARK: - Initializers

    public init(smufl: SMuFL) {
        self.smufl = smufl
    }
}

extension OtherDynamics: Equatable {}
extension OtherDynamics: Codable {}
