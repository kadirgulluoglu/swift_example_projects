import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("Primary").ignoresSafeArea(.all)
            VStack {
                
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200,height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 5))
                
                Text("Kadir Güllüoğlu")
                    .font(Font.custom("Caveat-Regular", size: 40))
                    .foregroundColor(.white)
                
                Text("Mobile Developer")
                    .font(.system(size:15))
                    .foregroundColor(.white)
                
                Divider()
                
                InfoView(text: "+90 532 175 21 75", icon: "phone.fill")
                InfoView(text: "kadirr@gmail.com", icon: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

