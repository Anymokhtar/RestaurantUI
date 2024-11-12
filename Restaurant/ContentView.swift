//
//  ContentView.swift
//  Restaurant
//
//  Created by Aresmouk El Mokhtar on 12/11/2024.
//

import SwiftUI

struct Restaurants{
    var uniqueId: Int
    var image: String
    var category: String
    var title: String
    var body:String
}

struct ContentView: View {
    
    let restaurants = [
            Restaurants(uniqueId: 1, image: "restu/chicken-skewers-with-slices-sweet-peppers-dill", category: "Italian", title: "Pasta Paradise", body: "Enjoy the best pasta dishes in town at Pasta Paradise!"),
            Restaurants(uniqueId: 2, image: "restu/flat-lay-food-arrangement-with-frame", category: "Mexican", title: "Taco Time", body: "Savor authentic Mexican flavors at Taco Time!"),
            Restaurants(uniqueId: 3, image: "restu/raw-beef-steaks-with-spices-rosemary-flat-lay-top-view", category: "Asian", title: "Sushi Sensation", body: "Indulge in fresh and delicious sushi at Sushi Sensation!")
                        ]
    let restaurantsList = [
        Trail(name: "Mountain View Trail", image: "restu/raw-beef-steaks-with-spices-rosemary-flat-lay-top-view", location: "Mountain Town, USA", reated: 4.5, distance: 5.3),
        Trail(name: "Mountain View Trail", image: "restu/raw-beef-steaks-with-spices-rosemary-flat-lay-top-view", location: "Mountain Town, USA", reated: 4.5, distance: 5.3),
        Trail(name: "Mountain View Trail", image: "restu/raw-beef-steaks-with-spices-rosemary-flat-lay-top-view", location: "Mountain Town, USA", reated: 4.5, distance: 5.3),
        
    ]
    
    var body: some View {
        NavigationView{
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Restaurants").font(.largeTitle).bold()
                    Text("Marrakech").foregroundColor(Color.gray.opacity(0.9))
                }
                Spacer()
                Image("profile/GVLiS52W8AEFact").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65,height: 65)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }.padding()
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(restaurants, id: \.uniqueId){
                        value in
                        ZStack{
                            Image("\(value.image)").resizable().shadow(color: .gray, radius: 20)
                            LinearGradient(colors: [.black, .red], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.5)
                            VStack(alignment: .leading){
                                Text(value.category).foregroundStyle(.white)
                                    .frame(maxHeight: .infinity, alignment: .topLeading)
                                    .padding()
                                Text(value.title).font(.title2)
                                    .foregroundStyle(.white)
                                    .frame(maxHeight: .infinity, alignment: .topLeading)
                                    .padding(.leading)
                                HStack{
                                    Text(value.body).foregroundStyle(.white)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .lineLimit(2)
                                    
                                    Spacer()
                                    
                                    Text("See All").foregroundStyle(.black)
                                        .padding(7).fontWeight(.bold)
                                        .background(.white).clipShape(
                                            RoundedRectangle(cornerRadius: 7))
                                        
                                    
                                }.padding()
                            }
                        }
                        
                    }.frame(width: 300, height: 200).cornerRadius(12.0)
                    
                }.padding()
            }
            
            HStack{
                Text("Top Rated").font(.title3).fontWeight(.bold)
                Spacer()
                Text("See All >").font(.system(size: 15)).fontWeight(.bold).foregroundStyle(.red)
            }.padding()
            
                   List(restaurantsList){
                    trail in
                    NavigationLink(destination: ShowDetailsView()){
                        
                        TrailRow(trail: trail)
                        
                    }.listRowSeparator(Visibility.hidden)
                       
                   }.listStyle(.plain)
            
            
            
        }
    }
    }
}


struct Trail:Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var location: String
    var reated: Double
    var distance: Double
}

struct TrailRow:View {
    var trail:Trail
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    Image(trail.image).resizable()
                        .background(.black)
                        .cornerRadius(7.0)
                        .frame(width: 140, height: 100)
                    VStack(alignment: .leading){
                        Text(trail.name).lineLimit(1).bold()
                        Text(trail.location).font(.subheadline).foregroundStyle(.gray).lineLimit(1)
                        HStack{
                            Image(systemName: "star.fill").imageScale(.small)
                                .foregroundStyle(.red)
                            Text(String(format: "%.1f", trail.reated)).font(.subheadline)
                        }
                    }
                    
                }
            }
            Spacer()
            VStack{
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                    .padding()
                Text(String(format: "%.1f", trail.distance)).font(.footnote).fontWeight(.bold)
                    .padding(4).overlay{
                        RoundedRectangle(cornerRadius: 3).stroke(.gray, lineWidth: 1)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
