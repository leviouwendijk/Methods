import Foundation

extension Compare {
    public enum Number {}
}

extension Compare.Number {
    public enum Decimal {}
}

extension Compare.Number.Decimal {
    public enum Method: Sendable {
        /// Exact decimal arithmetic — preferred default
        case direct
        /// Legacy: converts through Double before comparing
        case asDouble
    }

    /// Returns `true` when `diff` lies outside `±tolerance`.
    public static func exceeds(
        _ diff:      Foundation.Decimal,
        tolerance:   Foundation.Decimal,
        via method:  Method = .direct
    ) -> Bool {
        switch method {
        case .direct:           
            return _directExceeds(diff, tolerance)
        case .asDouble: 
            return _doubleExceeds(diff, tolerance)
        }
    }
}

private extension Compare.Number.Decimal {
    /// Exact: no floating-point loss.
    static func _directExceeds(
        _ diff:      Foundation.Decimal,
        _ tolerance: Foundation.Decimal
    ) -> Bool {
        let t = tolerance < .zero ? -tolerance : tolerance
        return diff != .zero && (diff < -t || diff > t)
    }

    /// Legacy: abs comparison after NSDecimalNumber → Double cast.
    static func _doubleExceeds(
        _ diff:      Foundation.Decimal,
        _ tolerance: Foundation.Decimal
    ) -> Bool {
        let lhs = abs((diff      as NSDecimalNumber).doubleValue)
        let rhs = abs((tolerance as NSDecimalNumber).doubleValue)
        return diff != .zero && lhs > rhs
    }
}
