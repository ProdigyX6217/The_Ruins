//
//  Player.swift
//  The_Ruins
//
//  Created by Student Laptop_7/19_1 on 9/11/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import Foundation
import SceneKit

class Player:SCNNode {
    
    // nodes
    private var daeHolderNode = SCNNode()
    private var characterNode:SCNNode!
    
    // MARK:- Initialization
    override init() {
        super.init()
        
        setupModel()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has been implemented")
    }
    
    
    // MARK:- scene
    private func setupModel() {
        
        //load dae childs
        let playerURL = Bundle.main.url(forResource: "art.scnassets/Scenes/Hero/idle", withExtension: "dae")
        
        let playerScene = try! SCNScene(url: playerURL!, options: nil)
        
        for child in playerScene.rootNode.childNodes {
            daeHolderNode.addChildNode(child)
        }
        addChildNode(daeHolderNode)
        
        //set mesh name
        characterNode = daeHolderNode.childNode(withName: "Bip01", recursively: true)
    }
    
    
    
    
    
}
