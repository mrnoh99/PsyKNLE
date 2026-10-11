import SwiftUI

struct TakeExamView: View {
    var allQuestions: [Question] = []
    @Binding var examOrResult: Bool

    var body: some View {
        VStack {
            HStack {
                Text("문제수: \(QuestionView.numberOfSelectedProblems(arrayInUsing: allQuestions))")
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                Button(action: {
                    examOrResult = false
                }, label: {
                    Image(systemName: "mail").symbolRenderingMode(.multicolor)
                    HStack { Text("정답확인") }
                })
                .buttonStyle(.borderedProminent)
                .springLoadingBehavior(.enabled)
                .scaleEffect(1.0)
            }

            List(allQuestions) { question in
                if let i = allQuestions.firstIndex(of: question) {
                    IndividualExamView(
                        question: question,
                        sequenceOfProblem: i + 1
                    )
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}
