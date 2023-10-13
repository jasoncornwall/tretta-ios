//
//  RoomScanner.swift
//  Tretta
//
//  Created by Jason C on 10/12/23.
//

import RoomPlan
import SwiftUI

struct RoomScanner: UIViewRepresentable {
    typealias UIViewType = RoomCaptureView
    
    var scanningState: RoomScannerState
    var didFinishScanning: ((_ result: Result<CapturedRoom, Error>) -> Void)
    
    func makeUIView(context: Context) -> RoomCaptureView {
        let view = RoomCaptureView()
        view.delegate = context.coordinator
        view.captureSession.run(configuration: RoomCaptureSession.Configuration())
        return view
    }
    
    func updateUIView(_ uiView: RoomCaptureView, context: Context) {
        if case .finishedScanning = scanningState {
            uiView.captureSession.stop()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

}

extension RoomScanner {
    
    @objc(RoomScanner)class Coordinator: NSObject, RoomCaptureViewDelegate {
        let scanner: RoomScanner?

        init(_ scanner: RoomScanner) {
            self.scanner = scanner
        }
        
        func encode(with coder: NSCoder) {
            
        }
        
        required init?(coder: NSCoder) {
            self.scanner = nil
        }
        
        func captureView(shouldPresent roomDataForProcessing: CapturedRoomData, error: (Error)?) -> Bool {
            true
        }
        
        func captureView(didPresent processedResult: CapturedRoom, error: (Error)?) {
            guard let scanner else { return }
            
            if let error {
                scanner.didFinishScanning(.failure(error))
                return
            }
            
            scanner.didFinishScanning(.success(processedResult))
        }
    }
    
}
