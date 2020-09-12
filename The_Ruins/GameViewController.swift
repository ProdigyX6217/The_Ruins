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
        player?.scale = SCNVector3Make(0.0026, 0.0026, 0.0026)
        player!.position = SCNVector3Make(0.0, 0.0, 0.0)
        player!.rotation = SCNVector4Make(0, 1, 0, Float.pi)
        
        mainScene.rootNode.addChildNode(player!)
    }
    
    
//    MARK:- walls
        
//    MARK:- camera

//    MARK:- touches + movement

//    MARK:- game loop functions
    
//    MARK:- enemies
    
}

//    MARK:- extensions
