
precedencegroup OptionalArgumentChainingPrecedence {
    associativity:  left
    higherThan:     NilCoalescingPrecedence
    lowerThan:      CastingPrecedence
}

infix operator ?> : OptionalArgumentChainingPrecedence

public func ?><T, R>(arg: T?, func: (T) -> R?) -> R? {
    guard let arg = arg else { return nil }
    return `func`(arg)
}

public func ?><T, U, R>(arg: (T?, U?), func: (T, U) -> R?) -> R? {
    guard let arg0 = arg.0, let arg1 = arg.1 else { return nil }
    return `func`(arg0, arg1)
}

public func ?><T, U, V, R>(arg: (T?, U?, V?), func: (T, U, V) -> R?) -> R? {
    guard let arg0 = arg.0, let arg1 = arg.1, let arg2 = arg.2 else { return nil }
    return `func`(arg0, arg1, arg2)
}

public func ?><T, U, V, W, R>(arg: (T?, U?, V?, W?), func: (T, U, V, W) -> R?) -> R? {
    guard let arg0 = arg.0, let arg1 = arg.1, let arg2 = arg.2, let arg3 = arg.3 else { return nil }
    return `func`(arg0, arg1, arg2, arg3)
}

public func ?><T, U, V, W, X, R>(arg: (T?, U?, V?, W?, X?), func: (T, U, V, W, X) -> R?) -> R? {
    guard let arg0 = arg.0, let arg1 = arg.1, let arg2 = arg.2, let arg3 = arg.3, let arg4 = arg.4 else { return nil }
    return `func`(arg0, arg1, arg2, arg3, arg4)
}
