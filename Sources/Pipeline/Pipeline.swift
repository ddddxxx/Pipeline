//
//  Pipeline.swift
//
//  This file is part of Pipeline. <https://github.com/ddddxxx/Pipeline>
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

precedencegroup PipelinePrecedence {
    associativity: left
    higherThan: NilCoalescingPrecedence
    lowerThan: CastingPrecedence
}

// MARK: |>

infix operator |> : PipelinePrecedence

@inlinable @inline(__always)
public func |><T, R>(arg: T, body: (T) throws -> R) rethrows -> R {
    return try body(arg)
}

// MARK: ?>

infix operator ?> : PipelinePrecedence

@inlinable @inline(__always)
public func ?><T, R>(arg: T?, body: (T) throws -> R?) rethrows -> R? {
    guard let arg = arg else { return nil }
    return try body(arg)
}

@inlinable @inline(__always)
public func ?><T, U, R>(arg: (T?, U?), body: (T, U) throws -> R?) rethrows -> R? {
    guard case let (arg0?, arg1?) = arg else { return nil }
    return try body(arg0, arg1)
}

@inlinable @inline(__always)
public func ?><T, U, V, R>(arg: (T?, U?, V?), body: (T, U, V) throws -> R?) rethrows -> R? {
    guard case let (arg0?, arg1?, arg2?) = arg else { return nil }
    return try body(arg0, arg1, arg2)
}

@inlinable @inline(__always)
public func ?><T, U, V, W, R>(arg: (T?, U?, V?, W?), body: (T, U, V, W) throws -> R?) rethrows -> R? {
    guard case let (arg0?, arg1?, arg2?, arg3?) = arg else { return nil }
    return try body(arg0, arg1, arg2, arg3)
}

@inlinable @inline(__always)
public func ?><T, U, V, W, X, R>(arg: (T?, U?, V?, W?, X?), body: (T, U, V, W, X) throws -> R?) rethrows -> R? {
    guard case let (arg0?, arg1?, arg2?, arg3?, arg4?) = arg else { return nil }
    return try body(arg0, arg1, arg2, arg3, arg4)
}
