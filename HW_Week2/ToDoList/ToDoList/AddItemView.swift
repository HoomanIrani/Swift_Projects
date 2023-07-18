import SwiftUI

struct AddItemView: View {
    
    @State var title: String = ""
    @State var description: String = ""
    @Binding var presentSheet: Bool
    @ObservedObject var viewModel: TodoListViewModel
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
            TextField("Description", text: $description)
            
            Spacer()
            
            Button {
                // save to viewModel
                if viewModel.updateTodo {
                    viewModel.updateSelectedTodo(title: title, description: description)
                } else {
                    viewModel.addTodo(ToDo(title: title, description: description))
                }
                presentSheet.toggle()
            } label: {
                Text(viewModel.updateTodo ? "Update" : "Add")
            }
        }
        .padding()
    }
}
