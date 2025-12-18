public func anysametype(
    _ x: Any.Type,
    _ y: Any.Type,
    verbose: Bool = false
) -> Bool {
    let result = (x.self == y.self)
    if verbose {
        print("type x ==", x.self)
        print("type y ==", y.self)
        print("result:", result)
    }
    return result
}
