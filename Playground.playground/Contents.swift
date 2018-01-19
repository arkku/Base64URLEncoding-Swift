import Foundation
import Base64URLEncoding

let myString = "Lorem?ipsum"
let encodedString = myString.base64URLEncoded()!
let decodedData = Data(base64URLEncoded: encodedString)!
let decodedString = encodedString.base64URLDecodedString()!

let myData = myString.data(using: .utf8)!
let encodedData = myData.base64URLEncodedData()

assert(decodedString == myString)
assert(decodedData == myData)

