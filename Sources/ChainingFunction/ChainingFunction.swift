//
//  ChainingFunction.swift
//
//  This file is part of ChainingFunction. <https://github.com/ddddxxx/ChainingFunction>
//  Copyright (c) 2017 Xander Deng
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//

precedencegroup FunctionApplicationPrecedence {
    associativity:  left
    higherThan:     NilCoalescingPrecedence
    lowerThan:      CastingPrecedence
}

// MARK: |>

infix operator |> : FunctionApplicationPrecedence

@inlinable @inline(__always)
public func |><T, R>(arg: T, body: (T) throws -> R) rethrows -> R {
    return try body(arg)
}

@inlinable @inline(__always)
public func |><T, U, R>(arg: (T, U), body: (T, U) throws -> R) rethrows -> R {
    return try body(arg.0, arg.1)
}

@inlinable @inline(__always)
public func |><T, U, V, R>(arg: (T, U, V), body: (T, U, V) throws -> R) rethrows -> R {
    return try body(arg.0, arg.1, arg.2)
}

@inlinable @inline(__always)
public func |><T, U, V, W, R>(arg: (T, U, V, W), body: (T, U, V, W) throws -> R) rethrows -> R? {
    return try body(arg.0, arg.1, arg.2, arg.3)
}

@inlinable @inline(__always)
public func |><T, U, V, W, X, R>(arg: (T, U, V, W, X), body: (T, U, V, W, X) throws -> R) rethrows -> R {
    return try body(arg.0, arg.1, arg.2, arg.3, arg.4)
}

// MARK: ?>

infix operator ?> : FunctionApplicationPrecedence

@inlinable @inline(__always)
public func ?><T, R>(arg: T?, body: (T) throws -> R?) rethrows -> R? {
    guard let arg = arg else { return nil }
    return try body(arg)
}

@inlinable @inline(__always)
public func ?><T, U, R>(arg: (T?, U?), body: (T, U) throws -> R?) rethrows -> R? {
    guard let arg0 = arg.0, let arg1 = arg.1 else { return nil }
    return try body(arg0, arg1)
}

@inlinable @inline(__always)
public func ?><T, U, V, R>(arg: (T?, U?, V?), body: (T, U, V) throws -> R?) rethrows -> R? {
    guard let arg0 = arg.0, let arg1 = arg.1, let arg2 = arg.2 else { return nil }
    return try body(arg0, arg1, arg2)
}

@inlinable @inline(__always)
public func ?><T, U, V, W, R>(arg: (T?, U?, V?, W?), body: (T, U, V, W) throws -> R?) rethrows -> R? {
    guard let arg0 = arg.0, let arg1 = arg.1, let arg2 = arg.2, let arg3 = arg.3 else { return nil }
    return try body(arg0, arg1, arg2, arg3)
}

@inlinable @inline(__always)
public func ?><T, U, V, W, X, R>(arg: (T?, U?, V?, W?, X?), body: (T, U, V, W, X) throws -> R?) rethrows -> R? {
    guard let arg0 = arg.0, let arg1 = arg.1, let arg2 = arg.2, let arg3 = arg.3, let arg4 = arg.4 else { return nil }
    return try body(arg0, arg1, arg2, arg3, arg4)
}

