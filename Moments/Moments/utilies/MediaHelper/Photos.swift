//
//  Photos.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import UIKit
import PhotosUI
import AVKit
import SwiftUI

typealias ImagePickerImageIsSelected = (UIImage,String) -> ()

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) private var presentationMode
    
    //用来控制通过系统相册获取图片还是通过摄像头
    let sourceType: UIImagePickerController.SourceType
    let imageIsSelected: ImagePickerImageIsSelected
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationModel: presentationMode, imageIsSelected: imageIsSelected)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerVC = UIImagePickerController()
        //设置代理
        imagePickerVC.delegate = context.coordinator
        imagePickerVC.sourceType = sourceType
        return imagePickerVC
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIImagePickerController
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding private var presentationModel: PresentationMode
        private let imageIsSelected: ImagePickerImageIsSelected
        //private let imageURL: ImagePickerImageFilePath
        
        init(presentationModel: Binding<PresentationMode>, imageIsSelected: @escaping ImagePickerImageIsSelected) {
            _presentationModel = presentationModel
            self.imageIsSelected = imageIsSelected
            //self.imageURL = imageURL
        }
        
        //从相册或相机获取到图片的代理方法
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            //从info中获取到图片
            let image = info[.originalImage] as! UIImage
            let fileManager = FileManager.default
            let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            let name = UUID().uuidString
            let filePath = "\(rootPath)/\(name).jpg"
            let imageData = image.jpegData(compressionQuality: 1.0)
            fileManager.createFile(atPath: filePath, contents: imageData, attributes: nil)
            Dlog(filePath)
            //执行imageIsSelected回调将图片传递出去
            imageIsSelected(image, filePath)
            //imageVC退出
            presentationModel.dismiss()
        }
    }
    
}
