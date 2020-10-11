//
//  GameViewController.swift
//  The_Ruins
//
//  Created by Student Laptop_7/19_1 on 9/10/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import UIKit
import SceneKit

enum GameState {
    case loading, playing
}

class GameViewController: UIViewController {
    
//    scene
    var gameView:GameView {return view as! GameView }
    var mainScene: SCNScene!
    
//    general
    var gameState:GameState = .loading
    
//    nodes
    private var player:Player?
    
//    movement
    private var controllerStoredDirection = SIMD2<Float>(repeating: 0.0)
    private var padTouch:UITouch?
    
//    MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
        setupPlayer()
        
        gameState = .playing
    }
    
    override var shouldAutorotate: Bool { return true }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    
//    MARK:- scene
    private func setupScene() {
        
        gameView.allowsCameraControl = true
        gameView.antialiasingMode = .multisampling4X
        
        mainScene = SCNScene(named: "art.scnassets/Scenes/Stage1.scn")
        gameView.scene = mainScene
        gameView.isPlaying = true
    }
    
    
//    MARK:- player
    private func setupPlayer() {
        
        player = Player()
        player!.scale = SCNVector3Make(0.0026, 0.0026, 0.0026)
        player!.position = SCNVector3Make(0.0, 0.0, 0.0)
        player!.rotation = SCNVector4Make(0, 1, 0, Float.pi)
        
        mainScene.rootNode.addChildNode(player!)
    }
    
    
//    MARK:- touches + movement
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            if gameView.virtualDPadBounds().contains(touch.location(in: gameView)) {
                
                if padTouch == nil {
                    
                    padTouch = touch
                    controllerStoredDirection = float2(0.0)
                }
            }
            
            if padTouch != nil { break }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = padTouch {
            
            let displacement = float2(touch.location(in: view))
            float2(touch.previousLocation(in: view))
            
            let vMix = mix(controllerStoredDirection, displacement, t: 0.1)
            let vClamp = clamp(vMix, min: -1.0, max: 1.0)
            
            controllerStoredDirection = vClamp
            
            print(controllerStoredDirection)
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        padTouch = nil
        controllerStoredDirection = float2(0.0)
    }
    
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        padTouch = nil
        controllerStoredDirection = float2(0.0)
    }
    
    
    }
    
//    MARK:- walls
        
//    MARK:- camera

//    MARK:- game loop functions
    
//    MARK:- enemies
    



//    MARK:- extensions
