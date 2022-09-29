//
//  ContentView.swift
//  Africa
//
//  Created by Jersy Fernandes on 30/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActivate: Bool = false
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    let hapitcs = UIImpactFeedbackGenerator(style: .medium)
   @State private var gridLayout: [GridItem]  = [ GridItem(.flexible()) ]
    
    func gridSitch () {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    var body: some View {
    
        let animals : [Animal] =
        Bundle.main.decode("animals.json")
        
        NavigationView {
            Group {
                if !isGridViewActivate{
                List {
                    CoverImageView()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
               
                    
                    ForEach(animals) {animal in
                        NavigationLink(
                            destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }}
                    CreditsView()
                        .modifier(CenterModifier())
                }}
                else{
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                            ForEach(animals){
                                animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
 
                    .animation(.easeIn)
                    }
                    
                }
                
                
                
            }
    
            .listStyle(.plain)
            .navigationTitle("Africa")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            print("List view is activated")
                            isGridViewActivate = false
                            hapitcs.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActivate ? .primary : .accentColor)
                        }
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActivate = true
                            hapitcs.impactOccurred()
                            gridSitch()
                        }){
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActivate ? .accentColor : .primary )
                        }
                    }
                }
            }
      
        }
     
  
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
