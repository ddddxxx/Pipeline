import Foundation
import ChainingFunction

let data = "1".data(using: .utf8)

let result: Int?
if let data = data,
    let str = String.init(data: data, encoding: .utf8),
    let double = Double(str),
    let int = Int.init(exactly: double) {
    result = int
} else {
    result = nil
}

let _result = (data, String.Encoding.utf8) ?> String.init(data:encoding:) ?> Double.init ?> Int.init(exactly:)

