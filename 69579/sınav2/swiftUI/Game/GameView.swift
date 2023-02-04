//
//  ContentView.swift
//  swiftUI
//
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel() //
    
    @State private var infoPresented = false
    
    private let nameAppHelper = DrawGameHelper()

    
    var body: some View {
        NavigationView{ //add the navigation view, this acts as the controller
            VStack{
                drawButton
                players
                
            }
            
            .navigationTitle("LATO 391 exam") //this is the title
            .navigationBarTitleDisplayMode(.inline) //makes the title smaller
        }
    }
    private var drawButton : some View{
        Button(viewModel.drawButtontitle) { //inside this, give an action
            viewModel.returnFirstNumber()
        }
        .padding(18)
        .background(Color.purple)
        .foregroundColor(Color.white)
        .cornerRadius(10)
    }
    
    
    
    
    private var players : some View {
        VStack{
            NameView(
                title: String(viewModel.firstNumber)
            )
            
            NameView(
                title: String(viewModel.secondNumber)
            )
            
            NameView(
                title: String(viewModel.thirdNumber)
            )
            NameView(
                title: String(viewModel.fourthNumber)
            )
            NameView(
                title: String(viewModel.fifthNumber)
            )
            NameView(
                title: String(viewModel.sixthNumber)
            )
         
            
        }
    }
    
    

}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
