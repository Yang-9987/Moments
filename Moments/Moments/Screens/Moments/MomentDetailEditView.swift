//
//  MomentDetailEditView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct MomentDetailEditView: View {
    @Binding var data: Moment.Data
    
    @State private var showImagePicker: Bool = false
    @State private var showUpLoadHandleImageType: Bool = false
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var imgURL: String = ""
    
    var body: some View {
        Form{
            Section(header: Text("Moments Info")) {
                HStack(alignment:.center) {
                    Text("Photo:")
                    Spacer()
                        .frame(width: 100)
                    Image(uiImage: UIImage(contentsOfFile: data.imageURL) ?? UIImage(named: data.img)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .padding(10)
                        .background(.ultraThickMaterial)
                        .cornerRadius(20)
                        .onTapGesture {
                            Dlog("图片选择方式")
                            showUpLoadHandleImageType.toggle()
                        }
                }
                .frame(height: 100)
                
                .confirmationDialog("ChangePhoto", isPresented: $showUpLoadHandleImageType, titleVisibility: .visible) {
                    Button("Album") {
                        Dlog("打开相册")
                        imagePickerSourceType = .photoLibrary
                        showImagePicker.toggle()
                    }
                    
                    Button("Camera") {
                        Dlog("打开相机")
                        imagePickerSourceType = .camera
                        showImagePicker.toggle()
                    }
                }
                .sheet(isPresented: $showImagePicker, content: {
                    ImagePicker(sourceType: imagePickerSourceType) { image,imgurl in
                        data.imageURL = imgurl
                    }
                })
                HStack {
                    Text("Title:")
                    TextField("Title", text: $data.title)
                }
                HStack {
                    DatePicker("Date:", selection: $data.dd)
                }
                MoodPicker(selection: $data.mood)
                HStack {
                    Text("Place:")
                    TextField("Place", text: $data.place)
                }
                HStack {
                    Text("City:")
                    TextField("City", text: $data.city)
                }
                Toggle(isOn: $data.isFavorite){
                    Text("Favorites")
                }
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $data.description)
                        .frame(height: 150)
                        .border(Color.gray)

                        if data.description.isEmpty {
                            Text("Type something")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(8)
                  }
                }
            }
        }
    }
}

struct MomentDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        MomentDetailEditView(data: .constant(Moment.sampleData[0].data))
    }
}
