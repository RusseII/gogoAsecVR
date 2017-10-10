//
//  ViewController.swift
//  AsecAR
//
//  Created by Russell Ratcliffe on 10/8/17.
//  Copyright © 2017 DeepHire. All rights reserved.
//

import UIKit
import ARKit
import SceneKit


class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func emersonButton(_ sender: Any) {
        print("clicked emerson's button")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func randomFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    

    @IBAction func mybuttom(_ sender: Any) {
    }
    
    
    
    @IBAction func addPath(_ sender: Any) {
        let cc = getCameraCoordinates(sceneView: sceneView)
      
        let length = Float(47)
        var cubeNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: CGFloat(length) , chamferRadius: 0))
        let eek = (cc.z) - (length/2)
        cubeNode.position = SCNVector3(cc.x ,cc.y - 0.5 , eek)
        sceneView.scene.rootNode.addChildNode(cubeNode)

        cubeNode = SCNNode(geometry: SCNBox(width: 4, height: 0.1, length: 0.1 , chamferRadius: 0))
        cubeNode.position = SCNVector3(cc.x +
            2 ,cc.y - 0.5, cc.z - 47)
        sceneView.scene.rootNode.addChildNode(cubeNode)
        
        
        cubeNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 8 , chamferRadius: 0))
        cubeNode.position = SCNVector3(cc.x +
            4 ,cc.y - 0.5, cc.z - 51)
         sceneView.scene.rootNode.addChildNode(cubeNode)
        
//
        
        cubeNode = SCNNode(geometry: SCNBox(width: 15, height: 0.1, length: 0.1 , chamferRadius: 0))
        cubeNode.position = SCNVector3(cc.x +
            11.5 ,cc.y - 0.5, cc.z - 55)
        sceneView.scene.rootNode.addChildNode(cubeNode)
        
    }
    
    struct myCameraCoordinates {
        var x = Float()
        var y = Float()
        var z = Float()
    }
    
    func getCameraCoordinates(sceneView:ARSCNView) -> myCameraCoordinates {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates = MDLTransform(matrix: cameraTransform!)
        
        var cc = myCameraCoordinates()
        cc.x = cameraCoordinates.translation.x
        cc.y = cameraCoordinates.translation.y
        cc.z = cameraCoordinates.translation.z
        
        return cc
    }
    
}

