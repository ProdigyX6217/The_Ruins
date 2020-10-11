//
//  Player.swift
//  The_Ruins
//
//  Created by Student Laptop_7/19_1 on 9/11/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import Foundation
import SceneKit


enum PlayerAnimationType {
    case walk, attack1, dead
}


class Player:SCNNode {
    
    // nodes
    private var daeHolderNode = SCNNode()
    private var characterNode:SCNNode!
    
    // animations
    private var walkAnimation = CAAnimation()
    private var attack1Animation = CAAnimation()
    private var deadAnimation = CAAnimation()
    
    // MARK:- Initialization
    override init() {
        super.init()
        setupModel()
        loadAnimation()
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
    
    
    // MARK:- animations
    private func loadAnimation() {
        
        loadAnimation(animationType: .walk, inSceneNamed: "art.scnassets/Scenes/Hero/walk", withIdentfier: "WalkID")
        
        loadAnimation(animationType: .attack1, inSceneNamed: "art.scnassets/Scenes/Hero/attack", withIdentfier: "attackID")

        loadAnimation(animationType: .dead, inSceneNamed: "art.scnassets/Scenes/Hero/die", withIdentfier: "DeathID")
    }
    
    
    private func loadAnimation(animationType:PlayerAnimationType, inSceneNamed scene:String, withIdentfier identifier:String) {
        
        let sceneURL = Bundle.main.url(forResource: scene, withExtension: "dae")!
        let sceneSource = SCNSceneSource(url: sceneURL, options: nil)!
        
        let animationObject:CAAnimation = sceneSource.entryWithIdentifier(identifier, withClass: CAAnimation.self)!
        
        animationObject.delegate = self
        animationObject.fadeInDuration = 0.2
        animationObject.fadeOutDuration = 0.2
        animationObject.usesSceneTimeBase = false
        animationObject.repeatCount = 0
        
        switch animationType {
        case .walk:
            
            animationObject.repeatCount = Float.greatestFiniteMagnitude
            walkAnimation = animationObject
        
        case .dead:
            
            animationObject.isRemovedOnCompletion = false
            deadAnimation = animationObject
            
        case .attack1:
            
            animationObject.setValue("attack1", forKey: "animationID")
            attack1Animation = animationObject
        }
        
    }
    
}

// MARK:- extensions

extension Player: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        //TODO later
        
    }
}

