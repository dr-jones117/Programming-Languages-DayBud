//
//  ContentView.swift
//
//  Created by Jonathan Mascarenhas on 10/19/23.
//

/*
View
A type that represents part of your app’s user interface and provides modifiers that you use to configure views.
*/

struct MyView: View { 
    var body: some View {
      Text("Hello, World!") 
    }
}

/*
Assemble the view’s body by combining one or more of the built-in views provided by SwiftUI, like the Text instance in the example above, plus other custom views that you define, into a hierarchy of views.

The View protocol provides a set of modifiers — protocol methods with default implementations — that you use to configure views in the layout of your app.
*/



struct MessageRow: View {
    let message: Message
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.yellow)
                Text(message.initials)
            }
            Text(message.content)
        }
    }
}

/*
  When SwiftUI renders a view hierarchy, it recursively evaluates each child view: The parent view proposes a size to the child views it contains, and the child views respond with a computed size.
The MessageRow view proposes a size to its only child, the HStack, which is the full size proposed to it by its own parent. The stack proportionally divides this
space between its child views, with system-default spacing between each child. This continues recursively:
● The ZStack proposes a size to its child views, the Circle and Text views.
● The Circle expands up to the size offered, while the Text takes just enough space for the string it contains.
● The ZStack returns the size of its largest child view, in this case the Circle.
When all child views have reported their size, the parent view renders them.

*/
