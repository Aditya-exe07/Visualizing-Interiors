//
//  wardrobeview.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct wardrobeview : View {
    var body: some View {
        ARViewContainer9().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer9: UIViewRepresentable {
    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        var arView: ARView?
        var modelEntity: ModelEntity?
        var currentScale: Float = 1.0
        var cancellable: AnyCancellable?
        var placedEntity: ModelEntity? // Track the most recently placed entity

        // Handle tap gesture for placing the model
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            guard let arView = arView else { return }
            let tapLocation = sender.location(in: arView)
            let results = arView.raycast(from: tapLocation, allowing: .existingPlaneGeometry, alignment: .horizontal)

            guard let firstResult = results.first else {
                print("No horizontal plane detected, model won't be placed.")
                return
            }

            if let placedEntity = placedEntity {
                placedEntity.removeFromParent()
            }

            let position = simd_make_float3(firstResult.worldTransform.columns.3)
            let anchor = AnchorEntity(world: position)

            if let modelEntity = modelEntity {
                let clonedEntity = modelEntity.clone(recursive: true)
                clonedEntity.position = [0, 0, 0]
                anchor.addChild(clonedEntity)
                arView.scene.addAnchor(anchor)
                placedEntity = clonedEntity
            }
        }

        // Handle pinch gesture for resizing the placed model
        @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
            guard let placedEntity = placedEntity else { return }
            if sender.state == .changed {
                let pinchScale = Float(sender.scale)
                let newScale = currentScale * pinchScale
                placedEntity.scale = SIMD3(repeating: newScale)
            }
            if sender.state == .ended {
                currentScale = placedEntity.scale.x
            }
        }

        // Handle rotation gesture for rotating the placed model
        @objc func handleRotation(_ sender: UIRotationGestureRecognizer) {
            guard let placedEntity = placedEntity else { return }
            if sender.state == .changed || sender.state == .ended {
                let rotationAmount = Float(sender.rotation)
                let newRotation = simd_quatf(angle: rotationAmount, axis: SIMD3<Float>(0, 1, 0))
                placedEntity.orientation = newRotation * placedEntity.orientation
            }
        }

        // Load the custom 3D model asynchronously
        func loadModel() {
            cancellable = ModelEntity.loadModelAsync(named: "wardrobe")
                .sink(receiveCompletion: { loadCompletion in
                    if case .failure(let error) = loadCompletion {
                        print("Error loading model: \(error)")
                    }
                }, receiveValue: { [weak self] model in
                    self?.modelEntity = model
                    self?.modelEntity?.scale = SIMD3(repeating: 0.1)
                })
        }
    }

    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator()
        coordinator.loadModel()
        return coordinator
    }

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.setupForAR9()
        context.coordinator.arView = arView

        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        tapGesture.delegate = context.coordinator
        arView.addGestureRecognizer(tapGesture)

        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePinch(_:)))
        pinchGesture.delegate = context.coordinator
        arView.addGestureRecognizer(pinchGesture)

        let rotationGesture = UIRotationGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleRotation(_:)))
        rotationGesture.delegate = context.coordinator
        arView.addGestureRecognizer(rotationGesture)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}

extension ARView {
    func setupForAR9() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)
    }
}

#Preview {
    wardrobeview()
}

