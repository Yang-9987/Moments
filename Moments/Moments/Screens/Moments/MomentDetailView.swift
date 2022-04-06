//
//  MomentDetailView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct MomentDetailView: View {
    @Binding var moment: Moment
    @State private var data = Moment.Data()
    @State private var isPresentingEditView: Bool = false
    
    @State private var showImagePicker: Bool = false
    @State private var showUpLoadHandleImageType: Bool = false
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var imgURL: String = ""
    
    var body: some View {
        VStack{
            VStack {
                BlurImage(image: Image(uiImage: UIImage(contentsOfFile: moment.imageURL) ?? UIImage(named: moment.img)!))
                    .offset(y: -10)
                    .ignoresSafeArea()
                
                CircleImage(image: Image(uiImage: UIImage(contentsOfFile: moment.imageURL) ?? UIImage(named: moment.img)!))
                    //.contentShape(Circle())
                    .offset(y: -280)
                    .padding(.bottom,-800)
                    .onTapGesture {
                        Dlog("图片选择方式")
                        showUpLoadHandleImageType.toggle()
                    }
            }
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
                    let url = moment.imageURL
                    FileOperation.removeFile(sourceUrl: url)
                    moment.imageURL = imgurl
                }
            })
            
            VStack(spacing: 10) {
                HStack {
                    Text(moment.title)
                        .font(.largeTitle)
                }
                
                HStack {
                    Text(moment.place)
                        .frame(width: 100, alignment: .leading)
                    Spacer()
                    Text(moment.mood.moodImg)
                        .frame(width: 70, alignment: .center)
                    Spacer()
                    Text(moment.city)
                        .frame(width: 100, alignment: .trailing)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                HStack {
                    Text(date2string(Datestr:moment.dd))
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("What To Say")
                        .font(.title2)
                    Text(moment.description)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            }
            .offset(y: 25)
            .padding(10)
            
            Spacer()
        }
        .navigationTitle(moment.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            Button("Edit") {
                isPresentingEditView = true
                data = moment.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                MomentDetailEditView(data: $data)
                    .navigationTitle(moment.title)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                moment.update(from: data)
                            }
                        }
                    }
            }
        }//Sheet
    }
}

struct MomentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MomentDetailView(moment: .constant(Moment.sampleData[0]))
    }
}
