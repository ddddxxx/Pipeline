//
//  PipelineTests.swift
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

import XCTest
@testable import Pipeline

class PipelineTests: XCTestCase {

    func testOptionalArgumentChaining() {
        func f(_ data: Data?) -> Int? {
            return (data, .utf8) ?> String.init(data:encoding:) ?> Double.init ?> Int.init(exactly:)
        }
        
        XCTAssertNil(f(nil))
        XCTAssertNil(f("a".data(using: .utf8)))
        XCTAssertNil(f("0.1".data(using: .utf8)))
        XCTAssertEqual(f("1".data(using: .utf8)), 1)
    }


    static var allTests = [
        ("testOptionalArgumentChaining", testOptionalArgumentChaining),
    ]
}
