import XCTest

import apiTests

var tests = [XCTestCaseEntry]()
tests += apiTests.allTests()
XCTMain(tests)
