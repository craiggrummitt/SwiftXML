//
//  ViewController.swift
//  XML
//
//  Created by Craig Grummitt on 24/08/2016.
//  Copyright © 2016 interactivecoconut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Import an XML document
        guard let url = Bundle.main.url(forResource: "books", withExtension: "xml") else { return }
        guard let xml = XML(contentsOf: url) else { return }
        //Create an XML Node
        let bookNode = XMLNode(name:"book")
        //Add child node with name and value
        bookNode.addChild(name: "title", value: "Robinson Crusoe")
        bookNode.addChild(name: "author", value: "Daniel Defoe")
        //Add attributes to node
        bookNode.attributes["isbn"] = "9789835004100"
        //Add child node with node
        xml[0].addChild(bookNode)
        //Remove child from XML
        xml[0].removeChild(at: 1)
        //Get/set with subscripts
        xml[0][0]["title"]?.text = "Great Expectations"
        //Print XML structure
        print(xml)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

