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

    public init(scaling: Scaling? = nil, pageLayout: PageLayout? = nil, systemLayout: SystemLayout? = nil, staffLayout: StaffLayout? = nil, appearance: Appearance? = nil, musicFont: EmptyFont? = nil, wordFont: EmptyFont? = nil, lyricFonts: [LyricFont], lyricLanguages: [LyricLanguage]) {
        self.scaling = scaling
        self.pageLayout = pageLayout
        self.systemLayout = systemLayout
        self.staffLayout = staffLayout
        self.appearance = appearance
        self.musicFont = musicFont
        self.wordFont = wordFont
        self.lyricFonts = lyricFonts
        self.lyricLanguages = lyricLanguages
    }
}

// FIXME: Redefine?
public struct Scaling {
    public init() {
    }
 }
extension Scaling: Equatable { }
extension Scaling: Codable { }
