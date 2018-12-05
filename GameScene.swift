//
//  GameScene.swift
//  Project23
//
//  Created by Tony Baulos on 2/1/17.
//  Copyright © 2017 Tony Baulos. All rights reserved.
//

import SpriteKit
import GameplayKit

protocol GameSceneDelegate: class
{
    func afterDie()
  
}

class GameScene: SKScene, SKPhysicsContactDelegate {

    weak var playDelegate: GameSceneDelegate? = nil
    
    var stage = 1
    
    var starfield: SKEmitterNode!
    var witch: SKSpriteNode? = nil
    var building: SKSpriteNode? = nil

    let canDestoryCategory: UInt32 = 0x1 << 0
    let canCollosionCategory: UInt32 = 0x1 << 1
    
    var possibleEnemies = ["rock", "knife", "fire", "ghost"]
    
    var gameTimer: Timer!
 
    var isGameOver = false
    var enemyInterval = 2.0
   
    var pass = false
  

    func newGame()
    {
        
        isGameOver = false
        witch = SKSpriteNode(imageNamed: "witch")
        if let _witch = witch {
            _witch.position = CGPoint(x: self.size.width/6, y:self.size.height/6)
            _witch.size = CGSize(width: self.size.width/5, height: self.size.width/5)
          _witch.physicsBody = SKPhysicsBody(circleOfRadius: _witch.size.height/2)
            _witch.physicsBody?.categoryBitMask = canDestoryCategory
            _witch.physicsBody?.contactTestBitMask = canCollosionCategory
            addChild(_witch)
        }
    
        resetBuilding()
     
        stage = 1
        enemyInterval = 2.0
        gameTimer = Timer.scheduledTimer(timeInterval: enemyInterval, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
      
    }
  
    func resetBuilding()
    {
        pass = false
        
        building?.removeAllActions()
        building?.removeFromParent()
        let randomDistribution = GKRandomDistribution(lowestValue: 1, highestValue: 3)
        let random = randomDistribution.nextInt()
      
        building = SKSpriteNode(imageNamed: "building\(random)")
        if let _building = building {
            _building.size =  CGSize(width: self.size.width/4, height: self.size.height/4)
            _building.position = CGPoint(x: self.size.width - _building.size.width/2, y: self.size.height/5)
            addChild(_building)
          let randomDistribution = GKRandomDistribution(lowestValue: 10, highestValue: 30)
          let random = randomDistribution.nextInt()
          let move = SKAction.moveTo(x: 0, duration: TimeInterval(random))
            _building.run(move) {
                if(!self.isGameOver) {
                    self.pass = true
                }
            }
            
            _building.zPosition = -1
        }
    }
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.black

        starfield = SKEmitterNode(fileNamed: "Starfield")!
        starfield.position = CGPoint(x: self.size.width, y: self.size.height)
        
        starfield.advanceSimulationTime(10)
        addChild(starfield)
        starfield.zPosition = -1
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self

        newGame()

    }

    override func update(_ currentTime: TimeInterval) {
        for node in children {
            if node.position.x < -300 {
                node.removeFromParent()
            }
        }

        if !isGameOver {
            if(pass) {
                stage += 1
                if(enemyInterval > 0.1) {
                    enemyInterval -= 0.1
                }
                resetBuilding()
                gameTimer.invalidate()
                gameTimer = Timer.scheduledTimer(timeInterval: enemyInterval, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
            }
        } else {
            
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        var location = touch.location(in: self)

        if location.y < 100 {
            location.y = 100
        } else if location.y > self.size.height-100 {
            location.y = self.size.height-100
        }
        witch?.position = location
    }

    func didBegin(_ contact: SKPhysicsContact) {
      
      var firstBody: SKPhysicsBody
      var secondBody: SKPhysicsBody
      
      if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{
        firstBody = contact.bodyA
        secondBody = contact.bodyB
      } else {
        firstBody = contact.bodyB
        secondBody = contact.bodyA
      }
      
      if (firstBody.categoryBitMask & canDestoryCategory ) != 0 && (secondBody.categoryBitMask & canCollosionCategory) != 0 {

        
        self.witch?.removeFromParent()
        self.witch = nil
        
        
        let explosion = SKEmitterNode(fileNamed: "explosion")!
        explosion.position = contact.contactPoint
        addChild(explosion)
    
        isGameOver = true
        gameTimer.invalidate()
        
        self.playDelegate?.afterDie()
      }
      
      
      
       
    }

  @objc func createEnemy() {
        let counts = GKRandomDistribution(lowestValue: 1, highestValue: stage).nextInt()
        let max = (counts<5) ? counts : 5
        for _ in 0..<max {
            
            possibleEnemies = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleEnemies) as! [String]
            let randomDistribution = GKRandomDistribution(lowestValue: 50, highestValue: 1024)
            let random = randomDistribution.nextInt()
          
          
            if( random % 4 > 0) {
              let sprite = SKSpriteNode(imageNamed: possibleEnemies[0])
              sprite.position = CGPoint(x: 1200, y: random)
              sprite.size = CGSize(width: 100, height: 100)
              
              addChild(sprite)
              
              sprite.physicsBody = SKPhysicsBody(circleOfRadius: 50)
              sprite.physicsBody?.categoryBitMask = canCollosionCategory
              sprite.physicsBody?.collisionBitMask = canCollosionCategory
              sprite.physicsBody?.velocity = (0 == random % 4) ?  CGVector(dx: 0, dy: -100) : CGVector(dx: -500, dy: 0)
//              sprite.physicsBody?.allowsRotation = ( random % 2 > 0)
              sprite.physicsBody?.angularVelocity = 5
              sprite.physicsBody?.linearDamping = 0
              sprite.physicsBody?.angularDamping = 1
            }
        }
    }
    
}
