import SwiftUI

struct PercentageReducerView: View {
    @State private var initialPercentage: Double = 100.0
    @State private var currentPercentage: Double = 100.0
    @State private var secondReductionRate: Double = 0.01
    @State private var startDate: Date = Date() // Запоминаем время старта
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack {
            Text("Текущий процент: \(String(format: "%.2f", currentPercentage))%")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                // Запуск или перезапуск таймера
                startDate = Date() // Обновляем стартовую дату
                startTimer()
            }) {
                Text("Начать уменьшение процента")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onDisappear {
            // Останавливаем таймер при выходе из экрана
            stopTimer()
        }
    }
    
    // Функция для обновления процента каждую секунду
    func updatePercentage() {
        let currentDate = Date()
        let elapsedSeconds = Calendar.current.dateComponents([.second], from: startDate, to: currentDate).second ?? 0
        
        // Пересчитываем процент на основе прошедших секунд
        currentPercentage = initialPercentage * pow(1.0 - (secondReductionRate / 100.0), Double(elapsedSeconds))
        
        // Если процент становится меньше 0, останавливаем таймер
        if currentPercentage <= 0 {
            currentPercentage = 0
            stopTimer()
        }
    }
    
    // Запуск таймера
    func startTimer() {
        stopTimer() // Останавливаем текущий таймер, если он запущен
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            updatePercentage()
        }
    }
    
    // Остановка таймера
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

struct PercentageReducerView_Previews: PreviewProvider {
    static var previews: some View {
        PercentageReducerView()
    }
}
