import SwiftUI

struct ContentView: View {
    
    var body: some View {
        sampleStackView()
    }
    fileprivate func sampleHorizantalView() -> some View {
        return HStack {
            Image(systemName: "square.and.arrow.up")
                .imageScale(.large)
                .foregroundColor(.black)
            Text("Kadir Güllüoğlu!")
            Spacer().frame(height: 2)
        }
        .padding()
    }
    fileprivate func sampleVerticalView() -> some View {
        return VStack {
            Image(systemName: "square.and.arrow.up")
                .imageScale(.large)
                .foregroundColor(.black)
            Text("Kadir Güllüoğlu!")
            Spacer().frame(height: 2)
        }
        .padding()
    }
     fileprivate func sampleStackView() -> some View {
         return ZStack (alignment: Alignment.center){
            Image(systemName: "square.and.arrow.up")
                .imageScale(.large)
                .foregroundColor(.black)
            Text("Kadir Güllüoğlu!")
            Spacer().frame(height: 2)
        }
        .padding()
    }
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
