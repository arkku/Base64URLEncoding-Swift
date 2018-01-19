Base-64 URL Encoding in Swift
=============================

This is a pure Swift implementation of base-64 URL encoding.
At the time of writing regular base-64 encoding already exists
in Apple's frameworks, but it has no support for the URL
variant. The URL variant differs in that it is URL safe (as per
its name) and it uses no padding.

~ [Kimmo Kulovesi](http://arkku.com/), 2018-01-19

Usage by Example
================

    import Base64URLEncoding
    
    let myString = "Lorem?ipsum"
    let encodedString = myString.base64URLEncoded()!
    
    let myData = myString.data(using: .utf8)!
    let encodedData = myData.base64URLEncodedData()
    
    let decodedData = Data(base64URLEncoded: encodedString)!
    let decodedString = encodedString.base64URLDecodedString()!

Additionally, ready-made custom `Data` coding blocks are provided for  `JSONDecoder` and `JSONEncoder`:

    let encoder = JSONEncoder()
    encoder.dataEncodingStrategy = .custom(base64URLDataEncoding)
    let myObject = [ myData ]
    let json = try! encoder.encode(myObject)

    let decoder = JSONDecoder()
    decoder.dataDecodingStrategy = .custom(base64URLDataDecoding)
    let decodedObject = try! decoder.decode([Data].self, from: json)

Installation
============

Git Submodule
-------------

Add the submodule as usual:

    git submodule add https://github.com/arkku/Base64URLEncoding-Swift

Then add `Base64URLEncoding.xcodeproj` to your project, go to your own
project's target and the _Build Phases_ tab. From there select
_Link Binary with Libraries_ and add your platform's
`Base64URLEncoding.framework`.

Swift Package Manager
---------------------

To import with the Swift Package Manager, add the dependency to your
`Package.swift` as follows:

    dependencies: [
        .package(url: "https://github.com/arkku/Base64URLEncoding-Swift", from: "1.0.0"),
    ],
    targets: [
        .target(name: "MyApp", dependencies: [ "Base64URLEncoding" ]),
    ]
