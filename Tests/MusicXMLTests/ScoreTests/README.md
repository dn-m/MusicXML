# ScoreTests

## Test Case Structure
The score tests consist of test suite executor and test cases. Any individual test case is a folder tha must contain a `manifest.yaml` file, otherwise the folder is not treated as a test case and thus skipped.

### Manifest
The `manifest.yaml`  defines the test case.

#### Parsing
The manifest must contain a `parsing` dictionary as test config for parsing.
- `xml_file_name`: the Score MusicXML file name including extension
- `assert`: whether to assert parsing success.

#### Comparison
The manifest may contain a `comparison` dictionary as test config for equality check.
- `expectation_class_name`: the name of the expectation class.
- `assert`: whether to assert equality between the parsed and expected MusicXML.

#### Metadata
The manifest must contain a `metadata` dictionary.
- `display_name`: the test name.
- `description`: an optional textual description of the score.
- `source`: an optional field for URL link to the source.

### Expectation Class
- The expectation class must conform to `ScoreTestExpectation` protocol and provide a `MusicXML` object as the expected result of parsing. The protocol requires the conformer to be a `class`. This is a restriction since `struct` is not dynamically loadable.
- The expectation class may be arbitrarily named, but is recommended to follow `<TestCaseName>ParsingExpectation` naming scheme. This class name must be the same as `ExpectationClassName` contained in the manifest.

