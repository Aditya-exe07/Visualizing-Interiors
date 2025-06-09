//
//  BackendView.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct BackendView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        var arView: ARView?
        var modelEntity: ModelEntity?
        var currentScale: Float = 1.0
        var currentRotation: Float = 0.0 // Track the current rotation
        var cancellable: AnyCancellable?
        var placedEntity: ModelEntity? // Track the most recently placed entity

        // Handle tap gesture for placing the model
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            guard let arView = arView else { return }

            // Get tap location in AR view
            let tapLocation = sender.location(in: arView)
            
            // Perform raycast to detect horizontal plane only
            let results = arView.raycast(from: tapLocation, allowing: .existingPlaneGeometry, alignment: .horizontal)

            // Ensure that raycast hit a valid horizontal plane
            guard let firstResult = results.first else {
                print("No horizontal plane detected, model won't be placed.")
                return
            }

            // Remove previously placed model if any
            if let placedEntity = placedEntity {
                placedEntity.removeFromParent()
            }

            // Get the position where the raycast hit the plane
            let position = simd_make_float3(firstResult.worldTransform.columns.3)
            let anchor = AnchorEntity(world: position)

            if let modelEntity = modelEntity {
                // Clone the model so it can be placed on the plane
                let clonedEntity = modelEntity.clone(recursive: true)
                clonedEntity.position = [0, 0, 0] // Set to the detected surface height
                anchor.addChild(clonedEntity)
                arView.scene.addAnchor(anchor)

                // Keep a reference to the placed entity
                placedEntity = clonedEntity
            }
        }

        // Handle pinch gesture for resizing the placed model
        @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
            guard let placedEntity = placedEntity else { return } // Ensure we are scaling the placed entity

            if sender.state == .changed {
                let pinchScale = Float(sender.scale)
                let newScale = currentScale * pinchScale
                placedEntity.scale = SIMD3(repeating: newScale) // Apply scale to the placed entity
            }

            if sender.state == .ended {
                currentScale = placedEntity.scale.x // Update the current scale after resizing
            }
        }

        // Handle rotation gesture for rotating the placed model
        @objc func handleRotation(_ sender: UIRotationGestureRecognizer) {
            guard let placedEntity = placedEntity else { return } // Ensure we are rotating the placed entity

            if sender.state == .changed {
                let rotationAmount = Float(sender.rotation)
                placedEntity.transform.rotation = simd_quatf(angle: currentRotation + rotationAmount, axis: [0, 1, 0]) // Rotate around Y-axis
            }

            if sender.state == .ended {
                currentRotation += Float(sender.rotation) // Update the current rotation after gesture ends
            }
        }

        // Load the custom 3D model asynchronously
        func loadModel() {
            cancellable = ModelEntity.loadModelAsync(named: "chair_swan") // Replace with your .usdz file name (without .usdz extension)
                .sink(receiveCompletion: { loadCompletion in
                    switch loadCompletion {
                    case .failure(let error):
                        print("Error loading model: \(error)")
                    case .finished:
                        break
                    }
                }, receiveValue: { [weak self] model in
                    self?.modelEntity = model
                    self?.modelEntity?.scale = SIMD3(repeating: 0.1) // Optional: Adjust initial scale if needed
                })
        }
    }

    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator()
        coordinator.loadModel() // Load the model when the view is created
        return coordinator
    }

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.setupForAR()
        context.coordinator.arView = arView

        // Add tap gesture recognizer for placing the model
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        tapGesture.delegate = context.coordinator
        arView.addGestureRecognizer(tapGesture)

        // Add pinch gesture recognizer for resizing the model
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePinch(_:)))
        pinchGesture.delegate = context.coordinator
        arView.addGestureRecognizer(pinchGesture)

        // Add rotation gesture recognizer for rotating the model
        let rotationGesture = UIRotationGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleRotation(_:)))
        rotationGesture.delegate = context.coordinator
        arView.addGestureRecognizer(rotationGesture)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}

extension ARView {
    func setupForAR() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal] // Only detect horizontal surfaces
        session.run(config)
    }
}

#Preview {
    BackendView()
}
