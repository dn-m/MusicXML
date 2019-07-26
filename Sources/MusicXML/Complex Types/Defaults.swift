//
//  Defaults.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The defaults type specifies score-wide defaults for scaling, layout, and appearance.
public struct Defaults: Codable, Equatable {
    public let scaling: Scaling?
    public let pageLayout: PageLayout?
    public let systemLayout: SystemLayout?
    public let staffLayout: StaffLayout?
    public let appearance: Appearance?
    public let musicFont: EmptyFont?
    public let wordFont: EmptyFont?
    public let lyricFonts: [LyricFont]
    public let lyricLanguages: [LyricLanguage]
}

// FIXME: Redefine?
public struct Scaling { }
extension Scaling: Equatable { }
extension Scaling: Codable { }
