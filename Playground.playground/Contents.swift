import Foundation
import Base64URLEncoding

let myString = "Lorem?ipsum"
let encodedString = myString.base64URLEncoded()!
let decodedData = Data(base64URLEncoded: encodedString)!
assert(String(data: decodedData, encoding: .utf8) == myString)
