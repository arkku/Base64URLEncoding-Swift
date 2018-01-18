Base-64 URL Encoding in Swift
=============================

This is a pure Swift implementation of base-64 URL encoding.
At the time of writing regular base-64 encoding already exists
in Apple's frameworks, but it has no support for the URL
variant. The URL variant differs in that it is URL safe (as per
its name) and it uses no padding.

~ [Kimmo Kulovesi](http://arkku.com/), 2018-01-19

Usage
=====

    import Base64URLEncoding

    let myString = "Lorem?ipsum"
    let encodedString = myString.base64URLEncoded()!
    let decodedData = Data(base64URLEncoded: encodedString)

