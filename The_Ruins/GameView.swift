//
//  GameView.swift
//  The_Ruins
//
//  Created by Student Laptop_7/19_1 on 9/10/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import SpriteKit
import SceneKit

// will hold the SpriteKit 2D UI

class GameView: SCNView {
    
    private var skScene: SKScene!
    private let overlayNode = SKNode()
    private var dpadSprite:SKSpriteNode!
    private var attackButtonSprite:SKSpriteNode!
    
    //    MARK:- lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup2DOverlay()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    deinit {
        
    }
    
//    MARK:- overlay functions
    private func setup2DOverlay() {
        
        let w = bounds.size.width
        let h = bounds.size.width
        
        skScene = SKScene(size: CGSize(width: w, height: h))
        skScene.scaleMode = .resizeFill
        
        skScene.addChild(overlayNode)
        overlayNode.position = CGPoint(x: 0.0, y:h)
        
        setupDpad(with: skScene)
        
        overlaySKScene = skScene
        skScene.isUserInteractionEnabled = true
    }
    
    
    private func layout2DOverlay() {
        overlayNode.position = CGPoint(x: 0.0, y: bounds.size.height)
    }
    
    
//    MARK:- D-Pad
    private func setupDpad(with scene:SKScene) {
        
        dpadSprite = SKSpriteNode(imageNamed: "art.scnassets/Assets/dpad.png")
        dpadSprite.position = CGPoint(x: 10.0, y: 10.0)
        dpadSprite.xScale = 1.0
        dpadSprite.yScale = 1.0
        dpadSprite.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        dpadSprite.size = CGSize(width: 150.0, height: 150.0)
        scene.addChild(dpadSprite)
    }
    
    func virtualDPadBounds() -> CGRect {
        
        var virtualDPadBounds = CGRect(x: 10.0, y: 10.0, width: 150.0, height:  150.0)
        
        virtualDPadBounds.origin.y = bounds.size.height - virtualDPadBounds.size.height + virtualDPadBounds.origin.y
        
        return virtualDPadBounds
    }
    
    
//    MARK:- attack button
    private func setupAttackButton(with scene:SKScene) {
        
        attackButtonSprite = SKSpriteNode(imageNamed: "art.scnassets/Assets/attack1.png")
        attackButtonSprite.position = CGPoint(x: bounds.size.height-110.0, y: 50)
        attackButtonSprite.xScale = 1.0
        attackButtonSprite.yScale = 1.0
        attackButtonSprite.size = CGSize(width: 60.0, height: 60.0)
        attackButtonSprite.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        attackButtonSprite.name = "attackButton"
        scene.addChild(attackButtonSprite)
    }
    
    func virtualAttackButtonBounds() -> CGRect {
           
        var virtualAttackButtonBounds = CGRect(x: bounds.width-110, y: 50, width: 60.0, height:  60.0)
           
           virtualAttackButtonBounds.origin.y = bounds.size.height - virtualAttackButtonBounds.size.height - virtualAttackButtonBounds.origin.y
           
           return virtualAttackButtonBounds
       }
    

    


}
