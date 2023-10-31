//: A SpriteKit based Playground

//import PlaygroundSupport
import SpriteKit

var width1 = 100
var height1 = 100
var dx_square = 50

var x_loc = 0.0
var y_loc = 0.0

class GameScene: SKScene {
    
    private var currentNode: SKNode?
  
    class func newGameScene() -> GameScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        
        scene.scaleMode = .aspectFill

        return scene
    }

    override func didMove(to view: SKView) {
        
        width1 = Int(UIScreen.main.bounds.width*0.8)
        height1 = Int(UIScreen.main.bounds.height*0.8)
        //print(UIScreen.main.bounds.width)
        //print(width)
        
        //scene.size = CGSize(width: width, height: height)
        let bg = SKSpriteNode(
            color: .green,
            size: CGSize(width: width1, height: height1)
        )
        self.addChild(bg)
        
        let node = SKSpriteNode(
            color: .red,
            size: CGSize(width: dx_square, height: dx_square)
        )
        node.name = "draggable"
        self.addChild(node)
        
    }
    var startLocation: CGPoint?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            startLocation = location
            
            print(startLocation!.x)
            print(startLocation!.y)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if node.name == "draggable" {
                    self.currentNode = node
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
        
            //let currentLocation = touches.first?.location(in: self)
            //let dx = touchLocation.x - startLocation!.x
            //let dy = touchLocation.y - startLocation!.y
            
            //print(touchLocation.x)
            //print(touchLocation.y)
            
            let width_cool = Int(width1-dx_square)
            let height_cool = Int(height1-dx_square)
            
            var x_loc = Double(touchLocation.x)
            if (x_loc>0.5*Double(width_cool)){
                x_loc = 0.5*Double(width_cool)
            }
            else if (x_loc < -0.5*Double(width_cool)){
                x_loc = -0.5*Double(width_cool)
            }
                
            var y_loc = Double(touchLocation.y)
            if (y_loc > 0.5*Double(height_cool)){
                y_loc = 0.5*Double(height_cool)
            }
            else if (y_loc < -0.5*Double(height_cool)){
                y_loc = -0.5*Double(height_cool)
            }
            node.position = CGPoint(x:x_loc, y: y_loc)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }

}
