import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle11Tests: XCTestCase {

    var scheduler = TestScheduler(initialClock: 0)
    var observer: TestableObserver<Void>!

    func testSolve() {
        observer = scheduler.createObserver(Void.self)
        let source = Observable.from([50.0, 200.0, 250.0, 400.0]).flatMap {
            Observable<Int>.timer($0, scheduler: self.scheduler).map { _ in () }
        }

        _ = Riddle11().solve(source: source, scheduler: scheduler).subscribe(observer)
        XCTAssertEqual(observer.events.count, 0)

        scheduler.advanceTo(50)
        XCTAssertEqual(observer.events.count, 1)

        scheduler.advanceTo(250)
        XCTAssertEqual(observer.events.count, 1)

        scheduler.advanceTo(400)
        XCTAssertEqual(observer.events.count, 2)
    }
}

