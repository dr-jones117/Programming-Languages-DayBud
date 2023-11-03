import SwiftUI

struct ContentView: View {
    @State private var quoteText: String = "\"You are what you eat...\""
    @State private var toDoList: [String] = []
    @State private var weatherInfo: String = ""

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            // Centered and Scaled Date Header
            Text("Wednesday 10/14/24")
                .font(.largeTitle)
                .padding()

            // Centered Quote Section
            VStack(alignment: .center) {
                Text(quoteText)
                    .font(.title2)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.secondary.opacity(0.2)))
            }
            .frame(maxWidth: .infinity)

            
            Button(action: {
                // Action for TO-DO button
            }) {
                VStack(alignment: .center, spacing: 10) {
                    Text("TO-DO")
                        .font(.headline)
                    ForEach(toDoList, id: \.self) { item in
                        Text(item)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.secondary.opacity(0.1)))
            }
            .frame(maxWidth: .infinity)

            // Centered Weather Button
            Button(action: {
                // Action for the Weather button
                print("Weather button pressed!")
            }) {
                VStack(alignment: .center) {
                    Text("Weather")
                        .font(.headline)
                    Text(weatherInfo)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.secondary.opacity(0.1)))
            }
            .frame(maxWidth: .infinity)

            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
