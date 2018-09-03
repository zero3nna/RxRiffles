import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle9Tests: XCTestCase {
    
    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<Void>!
    
    func testSolve() {
        observer = scheduler.createObserver(Void.self)
        let trigger = PublishSubject<Void>()
        let main = Observable<Int>.interval(1, scheduler: scheduler).map { _ in () }

        _ = Riddle9().solve(main: main, trigger: trigger).subscribe(observer)
        XCTAssertTrue(observer.events.isEmpty)
        
        scheduler.advanceTo(1)
        XCTAssertEqual(observer.events.count, 1)
        
        scheduler.advanceTo(16)
        XCTAssertEqual(observer.events.count, 16)
        
        trigger.onNext(())
        
        scheduler.advanceTo(30)
        XCTAssertEqual(observer.events.count, 17)
    }
}
