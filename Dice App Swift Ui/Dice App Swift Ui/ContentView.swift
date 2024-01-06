
import SwiftUI

struct ContentView: View {

    @State var leftNumber = 1
    @State var rightNumber = 1


    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    Dice(leftNumber)
                    Dice(rightNumber)
                }
                Spacer()
                Button(action: {
                    self.leftNumber = Int.random(in: 1...6)
                    self.rightNumber = Int.random(in: 1...6)
                }) {
                    Text("ROLL")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.all)
                }
                    .background(.red)
                    .cornerRadius(30)
            }
        }

    }
}



struct Dice: View {
    var n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.all, 40)
    }

    init(_ n: Int) {
        self.n = n
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
