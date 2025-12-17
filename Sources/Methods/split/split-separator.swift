import Foundation

public enum StringSplitError: Error, LocalizedError {
    case expectedPartCountNotMet(expected: Int, got: Int, StringSplitExpectation)

    public var errorDescription: String? {
        switch self {
        case .expectedPartCountNotMet(let expected, let got, let match):
            return "Expectation of split part count not met: \(expected) expected, \(got) found, (\(match.rawValue))"
        }
    }
}

public enum StringSplitExpectation: String, Sendable, RawRepresentable {
    case exact
    case minimum

    public func match(_ count: Int, to expectation: Int) -> Bool {
        switch self {
        case .exact:
            return (count == expectation)
        case .minimum:
            return (count >= expectation)
        }
    }
}

extension String {
    public func split(
        by separator: String.Element = "/",
        expecting expectation: Int? = nil,
        requirement: StringSplitExpectation = .minimum
    ) throws -> [String] {
        let parts = self
            .split(separator: separator, omittingEmptySubsequences: false)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }

        if let expectation {
            guard requirement.match(parts.count, to: expectation) else {
                throw StringSplitError.expectedPartCountNotMet(
                    expected: expectation,
                    got: parts.count,
                    requirement
                )
            }
        }
        return parts
    }
}
