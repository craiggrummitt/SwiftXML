##Simple XML parsing and serializing for Swift.

##Import an XML document 
Import an XML document simply, and the XML structure will be converted to `XMLNode` objects.

```
guard let url = Bundle.main.url(forResource: "books", withExtension: "xml") else { return }
guard let xml = XML(contentsOf: url) else { return }
```
##Use subscripts to get and set nodes and properties
```
xml[0][0]["title"]?.text = "Great Expectations"
```
##Create an XML node
Instantiate a node with its name, or its name and value:
```
let bookNode = XMLNode(name:"book")
```
##Add child node
You can add a child node with its name and value:
```
bookNode.addChild(name: "title", value: "Robinson Crusoe")
```
Or with another XML node:
```
xml[0].addChild(bookNode)
```
##Serialize XML
Regenerate XML structure from your data with the XMLNode's `description` property.