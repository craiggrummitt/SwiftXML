![SwiftXML: Simple XML parsing and serializing for Swift. ](SwiftXML.png)
## Import an XML document 
Import an XML document simply, and the XML structure will be converted to `XMLNode` objects.

```
guard let url = Bundle.main.url(forResource: "books", withExtension: "xml") else { return }
guard let xml = XML(contentsOf: url) else { return }
```
## Use subscripts
Use subscripts to set nodes and attributes:
```
xml[0][0]["title"]?.text = "Great Expectations"
xml[0][0].attributes["isbn"] = "38"
```
Similarly, use subscripts to get nodes and properties.
```
guard let title = xml[0][0]["title"]?.text,
let isbn = xml[0][0].attributes["isbn"] else {return}
print("\(title) with isbn of \(isbn)")
```
## Create an XML node
Instantiate a node with its name, or its name and value:
```
let bookNode = XMLNode(name:"book")
```
## Add child node
You can add a child node with its name and value:
```
bookNode.addChild(name: "title", value: "Robinson Crusoe")
```
Or with another XML node:
```
xml[0].addChild(bookNode)
```
## Remove child node
You can remove a child node with its index:
```
xml[0].removeChild(at: 1)
```
## Serialize XML
Regenerate XML structure from your data with the XMLNode's `description` property:
```
//either:
print(xml.description)
//or simply:
print(xml)
```

# Install SwiftXML
Drag the XML.swift file to your project

# Compatibility
SwiftXML is Swift 4.0 compatible.
