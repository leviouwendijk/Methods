extension Array where Element == Any {
    public var allNil: Bool {
        return Methods.all_nil(self)
    }

    public var notAllNil: Bool {
        return !self.allNil
    }
}

extension Array where Element == Any? {
    public var allNil: Bool {
        return Methods.all_nil(self)
    }

    public var notAllNil: Bool {
        return !self.allNil
    }
}
