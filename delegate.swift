import UIKit

// Создаем класс официанта
class Waiter {

    /// Свойство "заказ" - опциональная информация о текущем заказе. О заказе может узнать только официант, поэтому "private".
    private var order: String?

    /// Метод "принять заказ".
    func takeOrder(_ food: String) {
        print("What would you like?")
        print("Yes, of course!")
        order = food
        sendOrderToCook()
    }

    /// Метод "отправить заказ повару". Мог бы сделать только официант. Но как?
    private func sendOrderToCook() {
        // ??? Как передать повару заказ?
    }

    /// Метод "доставить блюдо клиенту". Умеет только официант.
    private func serveFood() {
        print("Your \(order!). Enjoy your meal!")
    }

}

// Создаем класс повара
class Cook {

    /// Свойство "сковорода". Есть только у повара.
    private let pan: Int = 1

    /// Свойство "плита". Есть только у повара.
    private let stove: Int = 1

    /// Метод "приготовить". Умеет только повар.
    private func cookFood(_ food: String) -> Bool {
        print("Let's take a pan")
        print("Let's put \(food) on the pan")
        print("Let's put the pan on the stove")
        print("Wait a few minutes")
        print("\(food) is ready!")
        return true
    }

}