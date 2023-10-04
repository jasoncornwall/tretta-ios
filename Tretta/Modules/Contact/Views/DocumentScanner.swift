//
//  DocumentScanner.swift
//  Tretta
//
//  Created by Jason C on 10/3/23.
//

import SwiftUI
import VisionKit

struct DocumentScanner: UIViewControllerRepresentable {
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        let scanner: DocumentScanner

        init(_ scanner: DocumentScanner) {
            self.scanner = scanner
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            var scannedPages: [UIImage] = []
            
            for i in 0..<scan.pageCount {
                scannedPages.append(scan.imageOfPage(at: i))
            }
            
            scanner.didFinishScanning(.success(scannedPages))
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            scanner.didCancelScanning()
        }
     
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            scanner.didFinishScanning(.failure(error))
        }
    }
    
    var didFinishScanning: ((_ result: Result<[UIImage], Error>) -> Void)
    var didCancelScanning: () -> Void
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scannerVC = VNDocumentCameraViewController()
        scannerVC.delegate = context.coordinator
        return scannerVC
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
