//
//  XMLTests.swift
//  XMLTests
//
//  Created by Craig Grummitt on 24/08/2016.
//  Copyright © 2016 interactivecoconut. All rights reserved.
//

import XCTest
@testable import XML

class XMLTests: XCTestCase {
  var url:URL!
  var xml:XML!
  override func setUp() {
    super.setUp()
    guard let url = Bundle.main.url(forResource: "books", withExtension: "xml") else {
      fatalError("No URL")
    }
    self.url = url
    guard let xml = XML(contentsOf: url) else {
      fatalError("XML Can't be converted to XML")
    }
    self.xml = xml
    
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func createBookNode()->XMLNode {
    //Create an XML Node
    let bookNode = XMLNode(name:"book")
    //Add child node with name and value
    bookNode.addChild(name: "title", value: "Robinson Crusoe")
    bookNode.addChild(name: "author", value: "Daniel Defoe")
    //Add attributes to node
    bookNode.attributes["isbn"] = "9789835004100"
    return(bookNode)
  }
  //Test creating an XML Node, including child nodes and attributes
  func testCreateNode() {
    let bookNode = createBookNode()
    XCTAssertEqual(bookNode.attributes["isbn"], "9789835004100")
    
    let titleNode = bookNode["title"]
    XCTAssertNotNil(titleNode)
    XCTAssertEqual(titleNode!.text, "Robinson Crusoe")
    
    let authorNode = bookNode["author"]
    XCTAssertNotNil(authorNode)
    XCTAssertEqual(authorNode!.text, "Daniel Defoe")
  }
  //Test creating XML from file check it is brought in correctly.
  func testCreateXMLFromFile() {
    XCTAssertEqual(xml[0].children.count, 2)
    let titleNode1 = xml[0][0]["title"]
    XCTAssertNotNil(titleNode1)
    XCTAssertEqual(titleNode1!.text, "Great Expectation")
    
    let titleNode2 = xml[0][1]["title"]
    XCTAssertNotNil(titleNode2)
    XCTAssertEqual(titleNode2!.text, "Don Quixote")
  }
  //Test adding and removing nodes, check children count is correct
  func testAddingRemovingCountingNodes() {
    //xml should be: Great Expectation, Don Quixote
    //Check count = 2
    XCTAssertEqual(xml[0].children.count, 2)
    xml[0].addChild(createBookNode())
    
    //now xml should be: Great Expectation, Don Quixote, Robinson Crusoe
    //Check count = 3
    XCTAssertEqual(xml[0].children.count, 3)
    
    //Remove Don Quixote
    xml[0].removeChild(at: 1)
    //now xml should be: Great Expectation, Robinson Crusoe
    
    //Check count = 2
    XCTAssertEqual(xml[0].children.count, 2)
    
    //Check children nodes are correct
    let titleNode1 = xml[0][0]["title"]
    XCTAssertNotNil(titleNode1)
    XCTAssertEqual(titleNode1!.text, "Great Expectation")
    
    let titleNode2 = xml[0][1]["title"]
    XCTAssertNotNil(titleNode2)
    XCTAssertEqual(titleNode2!.text, "Robinson Crusoe")
  }
  func testSetWithSubscript() {
    //first check the title of the first XML node
    let titleNode1 = xml[0][0]["title"]
    XCTAssertNotNil(titleNode1)
    XCTAssertEqual(titleNode1!.text, "Great Expectation")
    
    //change the title of the first XML node
    xml[0][0]["title"]?.text = "Great Expectations"
    
    //now check the title of the first XML node again
    let titleNode2 = xml[0][0]["title"]
    XCTAssertNotNil(titleNode2)
    XCTAssertEqual(titleNode2!.text, "Great Expectations")
    
  }
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
