public func sametype<X, Y>(
    _ x: X.Type,
    _ y: Y.Type,
    verbose: Bool = false
) -> Bool {
    let result = (X.self == Y.self)
    if verbose {
        print("tYpe X ==", X.self)
        print("tYpe Y ==", Y.self)
        print("result:", result)
    }
    return result
}
