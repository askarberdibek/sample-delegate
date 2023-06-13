import UIKit

protocol InterchangeViaElevatorProtocol{
    func cookOrder(order: String) -> Bool
}

// Создаем класс официанта
class Waiter {
    // Далее официанту добавим свойство "Получатель заказа через лифт"/ Официанту известно что получатель знает правило и приготовить то что в записке
    var delegate: InterchangeViaElevatorProtocol?
    
    var order: String?

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
//        if let cook = receiverOfOrderViaElevator{
//            cook.cookOrder(order: order ?? "")
//        }
        waiter.delegate?.cookOrder(order: waiter.order!)

    }

    /// Метод "доставить блюдо клиенту". Умеет только официант.
    private func serveFood() {
        print("Your \(order!). Enjoy your meal!")
    }
}

// Создаем класс повара
class Cook: InterchangeViaElevatorProtocol {

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
    
    // Необходимый метод, согласно правилу (протоколу):
    func cookOrder(order: String) -> Bool {
        cookFood(order)
    }
}

//let waiter = Waiter()
//let cook = Cook()

// добавим официанту заказ:

//waiter.delegate = cook
//waiter.takeOrder("Chicken")

class Chief: InterchangeViaElevatorProtocol{
    private let pan: Int = 1
    private let stove: Int = 1
    
    private func cookFood(_ food: String) -> Bool {
        print("Let's take a pan")
        print("Let's put \(food) on the pan")
        print("Let's put the pan on the stove")
        print("Wait a few minutes")
        print("\(food) is ready!")
        return true
    }
    
    // Необходимый метод согласно правилу (протоколу)
    func cookOrder(order: String) -> Bool{
        cookFood(order)
    }
    
    // шеф-повар умеет нанимать официантов в свое кафе
    func hireWaiter() -> Waiter{
        return Waiter()
    }
}

let chief = Chief()

let waiter = chief.hireWaiter()

waiter.takeOrder("Chiken")
