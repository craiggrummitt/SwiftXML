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
        guard let url = Bundle.main.url(forResource: "books", withExtension: "xml") else { return }
        guard let xml = XML(contentsOf: url) else { return }
        let bookNode = XMLNode(name:"book")
        bookNode.addChild(name: "title", value: "Robinson Crusoe")
        bookNode.addChild(name: "author", value: "Daniel Defoe")
        bookNode.attributes["isbn"] = "9789835004100"
        xml[0].addChild(bookNode)
        print(xml)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

