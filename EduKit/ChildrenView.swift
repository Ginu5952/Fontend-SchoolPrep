import SwiftUI

struct ChildrenView: View {
    @StateObject private var viewModel = ChildrenViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.top)
                if viewModel.isLoading {
                    VStack {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                            .scaleEffect(1.5)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .navigationBarTitle("Children", displayMode: .inline)
                } else {
                    List(viewModel.children) { child in
                        VStack(alignment: .leading) {
                                HStack {
                                   
                                    Text("\(child.firstName) \(child.lastName)")
                                        .font(.title)
                                        .foregroundColor(.clear)
                                                                        .overlay(
                                                                            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                                                                                           startPoint: .topLeading,
                                                                                           endPoint: .bottomTrailing)
                                                                                .mask(Text("\(child.firstName) \(child.lastName)")
                                                                                        .font(.title))
                                                                        )
                                }

                                HStack {
                                    Text("Age:")
                                    Spacer()
                                    Text("\(child.age)")
                                }

                                HStack {
                                    Text("Class:")
                                    Spacer()
                                    Text("\(child.classInfo.className)")
                                }

                                HStack {
                                    Text("Class ID:")
                                    Spacer()
                                    Text("\(child.classInfo.id)")
                                }

                                HStack {
                                    Text("Academic Year:")
                                    Spacer()
                                    Text("\(child.classInfo.academicYearStart) - \(child.classInfo.academicYearEnd)")
                                }

                                HStack {
                                    Text("Grade:")
                                    Spacer()
                                    Text("\(child.classInfo.grade)")
                                }

                                HStack {
                                    Text("Gender:")
                                    Spacer()
                                    Text("\(child.gender)")
                                }

                                HStack {
                                    Text("Username:")
                                    Spacer()
                                    Text("\(child.username)")
                                }
                        }  .padding(.vertical, 20)
                      
                            
                    }
                   
                    .cornerRadius(8)
                    .shadow(radius: 5)
                    
                   
                }
            }
            .onAppear {
                viewModel.fetchChildren()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    ChildrenView()
}