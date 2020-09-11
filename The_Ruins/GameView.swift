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
        
        overlaySKScene = skScene
        skScene.isUserInteractionEnabled = true
    }
    
    
    private func layout2DOverlay() {
        overlayNode.position = CGPoint(x: 0.0, y: bounds.size.height)
    }
    
    
//    MARK:- internal functions
    
//    MARK:- D-Pad
    
//    MARK:- attack button

    
    
}
