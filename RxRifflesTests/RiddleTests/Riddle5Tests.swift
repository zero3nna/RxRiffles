import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle5Tests: XCTestCase {

    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<Int>!
    
    func testSolve() {
        observer = scheduler.createObserver(Int.self)
        scheduler.start()
        let first = BehaviorSubject(value: 0)
        let second = BehaviorSubject(value: 0)

        let initial = [Recorded.next(0, 0)]
        _ = Riddle5Solution().solve(first: first, second: second).subscribe(observer)
        XCTAssertEqual(observer.events, initial)

        first.onNext(5)
        let firstEmit = [Recorded.next(0, 0), Recorded.next(0, 5)]
        XCTAssertEqual(observer.events, firstEmit)

        second.onNext(6)
        let secondEmit = [Recorded.next(0, 0), Recorded.next(0, 5), Recorded.next(0, 11)]
        XCTAssertEqual(observer.events, secondEmit)

        first.onNext(-6)
        let thirdEmit = [Recorded.next(0, 0), Recorded.next(0, 5), Recorded.next(0, 11), Recorded.next(0, 0)]
        XCTAssertEqual(observer.events, thirdEmit)
    }
}

