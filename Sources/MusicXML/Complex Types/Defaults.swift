//
//  Defaults.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The defaults type specifies score-wide defaults for scaling, layout, and appearance.
public struct Defaults {
    // MARK: - Instance Properties

    public let scaling: Scaling?
    public let pageLayout: PageLayout?
    public let systemLayout: SystemLayout?
    public let staffLayout: StaffLayout?
    public let appearance: Appearance?
    public let musicFont: Font?
    public let wordFont: Font?
    public let lyricFonts: [LyricFont]
    public let lyricLanguages: [LyricLanguage]

    // MARK: - Initializers

    public init(
        scaling: Scaling? = nil,
        pageLayout: PageLayout? = nil,
        systemLayout: SystemLayout? = nil,
        staffLayout: StaffLayout? = nil,
        appearance: Appearance? = nil,
        musicFont: Font? = nil,
        wordFont: Font? = nil,
        lyricFonts: [LyricFont] = [],
        lyricLanguages: [LyricLanguage] = []
    ) {
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

extension Defaults: Equatable {}

extension Defaults: Codable {
    private enum CodingKeys: String, CodingKey {
        case scaling
        case pageLayout = "page-layout"
        case systemLayout = "system-layout"
        case staffLayout = "staff-layout"
        case appearance
        case musicFont = "music-font"
        case wordFont = "word-font"
        case lyricFonts = "lyric-font"
        case lyricLanguages = "lyric-language"
    }
}
