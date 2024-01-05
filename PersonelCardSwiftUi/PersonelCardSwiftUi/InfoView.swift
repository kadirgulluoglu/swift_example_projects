

import SwiftUI

struct InfoView: View {

    let text: String
    let icon: String


    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .frame(height: 50)
            .overlay(HStack {
            Image(systemName: icon).foregroundColor(Color("Primary"))
                Text(text).foregroundColor(Color("TextColor"))
        }).padding(.all)
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", icon: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
