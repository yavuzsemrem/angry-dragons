//
//  GameScene.swift
//  angry-dragons
//
//  Created by Selim on 2.10.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    
    //var dragon = SKSpriteNode()
    
    var dragon = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    
    var originalPosition = CGPoint()
    var originalBox1Position = CGPoint()
    var originalBox2Position = CGPoint()
    var originalBox3Position = CGPoint()
    var originalBox4Position = CGPoint()
    var originalBox5Position = CGPoint()
    var gameStarted = false
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum ColliderType  : UInt32{
        case dragon = 1
        case box = 2
    }
    
    override func didMove(to view: SKView) {
        
//        let texture = SKTexture(imageNamed: "dragon")
//        dragon = SKSpriteNode(texture: texture)
//        dragon.position = CGPoint(x: -self.frame.width / 3 , y: -self.frame.height / 6)
//        dragon.size = CGSize(width: frame.width / 13, height: frame.height / 10)
//        dragon.zPosition = 1
//        self.addChild(dragon)
        
        self.scaleMode = .aspectFit
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsWorld.contactDelegate = self
        //Dragon
        
        dragon = childNode(withName: "dragon") as! SKSpriteNode
        let dragonTexture = SKTexture(imageNamed: "dragon")
        dragon.physicsBody = SKPhysicsBody(circleOfRadius: dragonTexture.size().height / 13)
        dragon.physicsBody?.affectedByGravity = false
        dragon.physicsBody?.mass = 0.15
        dragon.physicsBody?.isDynamic = true
        dragon.physicsBody?.categoryBitMask = ColliderType.dragon.rawValue
        dragon.physicsBody?.contactTestBitMask = ColliderType.dragon.rawValue
        dragon.physicsBody?.collisionBitMask = ColliderType.box.rawValue
        originalPosition = dragon.position
        
        
        
        
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 9, height: boxTexture.size().height / 9)
        
        //Box1
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.4
        box1.physicsBody?.collisionBitMask = ColliderType.dragon.rawValue
        originalBox1Position = box1.position
       
        
        //Box2
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.4
        box2.physicsBody?.collisionBitMask = ColliderType.dragon.rawValue
        originalBox2Position = box2.position
        
        //Box3
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.4
        box3.physicsBody?.collisionBitMask = ColliderType.dragon.rawValue
        originalBox3Position = box3.position
        
        //Box4
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.4
        box4.physicsBody?.collisionBitMask = ColliderType.dragon.rawValue
        originalBox4Position = box4.position
        
        //Box5
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.4
        box5.physicsBody?.collisionBitMask = ColliderType.dragon.rawValue
        originalBox5Position = box5.position
        
        //Label
        
        scoreLabel.fontName = "Arial"
        scoreLabel.fontSize = 60
        scoreLabel.fontColor = UIColor.black
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: frame.height / 4)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
    
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == ColliderType.dragon.rawValue || contact.bodyB.collisionBitMask == ColliderType.dragon.rawValue
        {
            score += 1
            scoreLabel.text = (String(score))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchedLocation = touch.location(in: self)
                let touchedNode = nodes(at: touchedLocation)
                
                if touchedNode.isEmpty == false{
                    
                    for node in touchedNode {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == dragon {
                                
                                dragon.position = touchedLocation
                            }
                        }
                    }
                    
                }
                
            }
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchedLocation = touch.location(in: self)
                let touchedNode = nodes(at: touchedLocation)
                
                if touchedNode.isEmpty == false {
                    
                    for node in touchedNode {
                        
                        if let sprite = node as? SKSpriteNode{
                            if sprite == dragon {
                                dragon.position = touchedLocation
                            }
                        }
                        
                    }
                    
                }
                
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchedLocation = touch.location(in: self)
                let touchedNode = nodes(at: touchedLocation)
                
                if touchedNode.isEmpty == false{
                    
                    for node in touchedNode {
                        
                        if let sprite = node as? SKSpriteNode{
                            if sprite == dragon {
                                
                                let dx = -(touchedLocation.x - originalPosition.x)
                                let dy = -(touchedLocation.y - originalPosition.y)
                               
                                dragon.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
                                dragon.physicsBody?.affectedByGravity = true
                                gameStarted = true
                                
                                
                            }
                        }
                        
                    }
                    
                }
                
            }
            
        }
       
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        if let dragonPhysicsBody = dragon.physicsBody {
            
            if dragonPhysicsBody.velocity.dx <= 0.1 && dragonPhysicsBody.velocity.dy <= 0.1 && dragonPhysicsBody.angularVelocity <= 0.1 &&
                gameStarted == true{
                
                dragonPhysicsBody.affectedByGravity = false
                dragonPhysicsBody.velocity = CGVector(dx: 0, dy: 0)
                dragonPhysicsBody.angularVelocity = 0
                dragonPhysicsBody.node?.position = originalPosition
                dragonPhysicsBody.node?.zRotation = 0
                
                
                //Original Positions for boxes
                box1.physicsBody?.node?.position = originalBox1Position
                box2.physicsBody?.node?.position = originalBox2Position
                box3.physicsBody?.node?.position = originalBox3Position
                box4.physicsBody?.node?.position = originalBox4Position
                box5.physicsBody?.node?.position = originalBox5Position
                
                
                //Original Rotations for boxes
                
                box1.zRotation = 0
                box2.zRotation = 0
                box3.zRotation = 0
                box4.zRotation = 0
                box5.zRotation = 0
                
                score = 0
                scoreLabel.text = String(score)
                
                gameStarted = false
                
                
            }
            
        }
        
    }
}
