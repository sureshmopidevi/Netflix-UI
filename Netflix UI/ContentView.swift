//
//  ContentView.swift
//  Netflix UI
//
//  Created by Sukshi  on 19/11/20.
//
import SwiftUI

var images: [String] {
    var im: [String] = []
    for _ in 1...10 {
        let imageID = String((1...12).randomElement()!)
        let imageName = "Image-\(imageID)"
        if !im.contains(imageName) {
            im.append(imageName)
        }
    }
    return im
}

struct ContentView: View {
    var categories: [String] {
        return ["My list", "Comedy", "Fantasy", "Sci-fi", "Horror", "Drama", "Romantic"]
    }

    var body: some View {
        VStack(spacing: 8) {
            NavBarView()
                .frame(height: 80)
                .background(Color.black)
                .padding()
            ScrollView(.vertical,showsIndicators:false) {
                VStack(spacing: 32) {
                    CarouselView()
                    CategoriesView(categories: categories)
                    Text("Developed by Suresh Mopidevi")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .italic()
                        .padding(.bottom,32)
                }
            }
        }.background(Color.black)
            .ignoresSafeArea()
    }
}



// MARK: - Navbar

struct NavBarView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    print("Edit button was tapped")
                }) {
                    Image(systemName: "text.justifyleft")
                        .resizable()
                }.frame(width: 22, height: 22, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.top, 26)
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, alignment: .center)
                    .padding(.top, 20)
                Spacer()
                Button(action: {
                    print("Edit button was tapped")
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                }.frame(width: 22, height: 22, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.top, 26)
            }
        }
    }
}

// MARK: - Carousel

struct CarouselView: View {
    var cImages: [String] = ["c1", "c2", "c3"]
    var body: some View {
        ScrollView(.horizontal,showsIndicators:false) {
            LazyHStack {
                ForEach(cImages, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 240)
                }
            }
        }
    }
}

// MARK: - Categories

struct CategoriesView: View {
    var categories: [String]
    var body: some View {
        ForEach(categories, id: \.self) { cat in
            LazyVStack {
                CategoryView(heading: cat)
            }
        }
    }
}

// MARK: - Category list with title

struct CategoryView: View {
    var heading: String
    @State var presentingModal = false
    var body: some View {
        VStack(alignment: .leading) {
            Text(heading)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.leading, 8)
            ScrollView(.horizontal,showsIndicators:false) {
                LazyHStack {
                    ForEach(images, id: \.self) { image in
                        Button.init(action: {
                            print("GO")
                        }, label: {
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 108, height: 160)
                                .cornerRadius(4)
                                .shadow(radius: 8)
                                .padding(4)
                        })
                    }
                }.padding(.leading, 8)
            }
        }
    }
}

struct DetailView:View {
    var body: some View {
        Text("Hello there")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
