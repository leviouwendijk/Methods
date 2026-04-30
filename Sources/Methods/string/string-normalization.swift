import Foundation

public func trimmedOrNil(
    _ value: String?
) -> String? {
    guard let value else {
        return nil
    }

    return trimmedOrNil(
        value
    )
}

public func trimmedOrNil(
    _ value: String
) -> String? {
    value.nilIfBlank
}

extension String {
    public var trimmed: String {
        return self.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
    }

    public var isBlank: Bool {
        return self.trimmed.isEmpty
    }

    public var nilIfBlank: String? {
        let trimmed = self.trimmed

        guard !trimmed.isEmpty else {
            return nil
        }

        return trimmed
    }
}

extension Optional where Wrapped == String {
    public var trimmedOrNil: String? {
        guard let value = self else {
            return nil
        }

        return value.nilIfBlank
    }
}
