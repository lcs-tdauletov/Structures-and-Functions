/*:
 [Previous](@previous)
 
 The following statement is required to make the playground run.
 
 
 Please do not remove.
 */
import Foundation
/*:
 ## Exercise
 
 Write a function named **shortestDistance** that determines the shortest distance from a point on a Cartesian plane to a line on a Cartesian plane.
 
 The function header should look like this:
 
  ![example](example1.png "example")
 
 You can re-use the **Point** structure and the *distance* function.
 
 You should declare a new **Line** structure.
 
 Recall that a line is defined by it's *slope* and it's *vertical intercept*. What stored properties would you create for a **Line** structure?
 
 Recall that slope, in turn, is defined by it's *rise* and *run*. Could you create a **Slope** structure? What stored properties might it define?
 
 Recall that the shortest distance from a point to a line is the *perpendicular* distance from that point to the line.
 
 Here is a [complete example showing how to find the shortest distance from a point to a line](http://russellgordon.ca/lcs/shortest-distance-example.pdf), using symbolic algebra.
 
 Your job is to implement a solution in code that carries out the necessary mathematics. The beautiful part of this effort is that, once you've "taught" the computer how to do this correctly, you will never need to do this type of work manually again. 👍🏽😅🎉

*/

// Begin here... once you teach the computer to do this, you will never need to do it by hand again! :)

public struct Point {
    var x : Double = 0.0
    var y : Double = 0.0
}

var cabinSite = Point(x: 6, y: 1.5)


public struct Slope {
    var rise : Double = 1.0
    var run : Double = 1.0
}

public struct Line {
    var slope : Slope = Slope(rise: 3.0, run: 4.0)
    var verticalIntercept : Double = 0.0
}



var slopeOfTheExistingRoad = Slope(rise: -4, run: 8)
var existingRoad = Line(slope: slopeOfTheExistingRoad, verticalIntercept: 9.5)

public func getSlopeOfPerpendicularLine(from givenLine: Line) -> Slope {
    return Slope (rise: givenLine.slope.run, run: givenLine.slope.rise * -1)
    
}

let perpendicularLinesSlope = getSlopeOfPerpendicularLine(from: existingRoad)





public func getVerticalIntercept(from p: Point, onLineWIth m: Slope) -> Double {
    
    
    let mAsDecimal = m.rise/m.run
    
    return p.y - mAsDecimal * p.x
    
    
}

let perpendicularLineVerticalIntercept = getVerticalIntercept(from: cabinSite, onLineWIth: perpendicularLinesSlope)

let newRoad = Line(slope:perpendicularLinesSlope, verticalIntercept: perpendicularLineVerticalIntercept)

public func getPointOfIntersection(between first: Line, and second: Line) -> Point{
    
    let verticalInterceptDifference = first.verticalIntercept - second.verticalIntercept
    
    
    let slopeDifference = second.slope.rise/second.slope.run - first.slope.rise/first.slope.run
    
    let x = verticalInterceptDifference/slopeDifference
    
    let y =  first.slope.rise/first.slope.run * x + first.verticalIntercept
    
    
    
    
    return Point(x: x, y: y)
}


getPointOfIntersection(between: existingRoad, and: newRoad)


func distance(from: Point, to: Point) -> Double{
    
    return sqrt( pow(from.x - to.x, 2) + pow(to.y - from.y, 2))
}



let distance = sqrt(pow(cabinSite.x - 8, 2) + pow(cabinSite.y - 5.5, 2))

print(distance)

func shortestDistance(from providedPoint: Point, to providedLine: Line) -> Double{
    let perpendicularLineVerticalIntercept = getVerticalIntercept(from: providedPoint, onLineWIth: perpendicularLinesSlope)
    let newLine = Line(slope: perpendicularLinesSlope, verticalIntercept: perpendicularLineVerticalIntercept)
    
    let pointOfIntersection = getPointOfIntersection(between: providedLine, and: newLine)
    
    let shortestDistance = distance(from: providedPoint, to: pointOfIntersection)
    return shortestDistance
}

var cabinSite = Point(x: 6, y: 1.5)

var slopeOfExistingRoad = Slope(rise: -1, run: 2)

var existingRoad = Line(slope: slopeOfExistingRoad, verticalIntercept: 9.5)



shortestDistance(from: cabinSite, to: existingRoad)





