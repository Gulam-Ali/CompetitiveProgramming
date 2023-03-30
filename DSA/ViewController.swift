//
//  ViewController.swift
//  DSA
//
//  Created by apple on 13/01/23.
//

import UIKit

class Tax{
    var gst : Double
    init(gstValue:Double) {
        self.gst = gstValue
    }
}

struct person {
    var totalprice : Double
    var taxx : Tax
}




// MARK: -  View controller

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let person1 = person(totalprice: 123, taxx: Tax(gstValue: 10.0))
//        var person2 = person1
//        person2.totalprice = 1000
//        person2.taxx.gst = 1000
//        print("person1 total price -> \(person1.totalprice) & tax -> \(person1.taxx.gst)")
//        print("person2 total price -> \(person2.totalprice) & tax -> \(person2.taxx.gst)")
//        
        
        // Do any additional setup after loading the view.
//        let array = [2,4,6,8,9,10,15,16,18,20,22,23,24,30,34,38]
//        print(binarySearch(arr: array, num: 23))
        
//        let randomarr = [2,5,3,6,8,10,9,12,11,19,16,17,15]
//        print(binarySearchWithSorting(array: randomarr, num: 16))
        
//        let colors = ["red","green","blue","red","white","red","white"]
//        print(mostCommonElement(array: colors))
        
//        let randomNumber = [2,3,1,6,32,15,78,17,85,48,51]
//        print(mergeSort(arr: randomNumber))
        
        
       // let numberss = [1,2,3,4,6,8,12]
        //print(byNaiveApproach(arr: numberss, num: 10))
        //print(findIndexesFromArray(numbers: numberss, target: 4))
        
        //print(isPalindrome(word: "Madam"))
        
        //print([0,1] + createFibonacciSeries(num: 5, first: 0, second: 1))
        
        
//        let arr = [2,4,1,9,8,5,3]
//        print(SortByMergeSort(array: arr))
        
//        let arr1 = [2,1,3,4]
//        let arr2 = [2,6,9,5,11,15,13,3,4]
//        print(IntersectionOfTwoArrays(first: arr1, second: arr2))
        
        
       // print(reverse(-320))
        
//        let grid_1 : [[String]] = [
//            ["1","1","1","1","0"],
//            ["1","1","0","1","0"],
//            ["1","1","0","0","0"],
//            ["0","0","0","0","0"]
//          ]
//
//        let grid_3 : [[String]] = [
//            ["1","1","0","0","0"],
//            ["1","1","0","0","0"],
//            ["0","0","1","0","0"],
//            ["0","0","0","1","1"]
//          ]
//
//        print(findNumberOfIsland(grid: grid_3))
        
        
        print(sortByBubbleSort(arr: [2,4,1,0,8,3]))
    }
    
    
    
    // MARK: -  Quick sort
    
    func applyQuickSort(arr:[Int]) -> [Int]{
        var less = [Int]()
        var equal = [Int]()
        var greater = [Int]()
        if arr.count > 1{
            let pivot = arr[0]
            for i in arr{
                if i < pivot{
                    less.append(i)
                }else if i > pivot{
                    greater.append(i)
                }else{
                    equal.append(i)
                }
            }
            return applyQuickSort(arr: less) + equal + applyQuickSort(arr: greater)
        }else{
            return arr
        }
    }
    
    
    
    // MARK: -  Bubble sort
    
    func sortByBubbleSort(arr:[Int]) -> [Int]{
        var mutableArr = arr
        for _ in 0..<mutableArr.count - 1{
            for j in 0..<mutableArr.count - 1{
                if mutableArr[j] > mutableArr[j+1]{
                    var temp = mutableArr[j]
                    mutableArr[j] = mutableArr[j+1]
                    mutableArr[j+1] = temp
                }
                
            }
        }
        return mutableArr
    }
    
    
            
    // MARK: -  Number of island problem
    
    var mutableGrid : [[String]]!
    
    func findNumberOfIsland(grid:[[String]]) -> Int{
        
        guard !grid.isEmpty else {return 0}
        
        var islandCount = 0
        mutableGrid = grid
        for x in 0..<mutableGrid.count{
            for y in 0..<mutableGrid[x].count{
                let point = mutableGrid[x][y]
                if point == "1"{
                    islandCount += 1
                    dfs_destroyIslands(x: x, y: y, gridd: mutableGrid)
                }
            }
        }
        return islandCount
    }
    
    private func dfs_destroyIslands(x:Int,y:Int,gridd:[[String]]){
        guard gridd.indices.contains(x), gridd[x].indices.contains(y), gridd[x][y] == "1" else {return}
        mutableGrid[x][y] = "0"
        
        //top
        dfs_destroyIslands(x: x, y: y + 1, gridd: mutableGrid)
        //bottom
        dfs_destroyIslands(x: x, y: y - 1, gridd: mutableGrid)
        //left
        dfs_destroyIslands(x: x - 1, y: y, gridd: mutableGrid)
        //right
        dfs_destroyIslands(x: x + 1, y: y, gridd: mutableGrid)
    }
         
    // MARK: -  Reverse
    func reverse(_ x: Int) -> Int {
        var number = x
        var reversedNumber = 0
        //[-231, 231 - 1]
        let intMax = (2 << 30) - 1
        let intMin = (-intMax + 1)

        while number != 0 {
            let digit = number % 10
            number /= 10
            if reversedNumber > intMax / 10 || (reversedNumber == intMax / 10 && digit > 7) {
                return 0
            }
            if reversedNumber < intMin / 10 || (reversedNumber == intMin / 10 && digit < -8) {
                return 0
            }
            reversedNumber = reversedNumber * 10 + digit
        }
        return reversedNumber
    }
       
    
    // MARK: -  Intersection of two unsorted array
    
    func IntersectionOfTwoArrays(first:[Int],second:[Int]) -> [Int]{
        var result : Set<Int> = []
        var hashmapp = [Int:Int]()
        
        for (ind,val) in first.enumerated(){
            hashmapp[val] = ind
        }
        
        for num in second{
            if let _ = hashmapp[num]{
                result.insert(num)
            }
        }
        
        return Array(result)
        
    }
                        
                 
    // MARK: -  Merge SORT
    
    func SortByMergeSort(array:[Int]) -> [Int]{
        guard array.count > 1 else {return array}
        let leftArr = Array(array[0..<array.count/2])
        let rightArr = Array(array[array.count/2..<array.count])
        return mergeSubArray(left: SortByMergeSort(array: leftArr), right: SortByMergeSort(array: rightArr))
    }
    
    func mergeSubArray(left:[Int],right:[Int]) -> [Int]{
        var leftarray = left
        var rightarray = right
        var merged = [Int]()
        
        while leftarray.count > 0 && rightarray.count > 0{
            if leftarray.first! < rightarray.first!{
                merged.append(rightarray.removeFirst())
                
            }else{
                merged.append(leftarray.removeFirst())
            }
        }
        
        return merged + leftarray + rightarray
    }
    
    
    // MARK: -  Create fibonacci
    func createFibonacciSeries(num:Int,first:Int,second:Int) -> [Int]{
        if num == 0{
            return []
        }
    
        return [first + second] + createFibonacciSeries(num: num - 1, first: second, second: first + second)
        
    }
    
    
    // MARK: -  check if word is palindrome
    func isPalindrome(word:String) -> Bool{
        var characterss = Array(word.lowercased())
        var currentIndex = 0
        while currentIndex < characterss.count/2{
            if characterss[currentIndex] != characterss[characterss.count - currentIndex - 1]{
                return false
            }
            
            currentIndex += 1
        }
        return true
    }
    
    
    // MARK: -  find indexes of numbers that when added is equal to provided target
    
    func findIndexesFromArray(numbers:[Int], target:Int) -> [Int]{
        var numbersDict : [Int:Int] = [:]
        
//        for (index,value) in numbers.enumerated(){
//            if let otherIndex = numbersDict[target - value]{
//                return [index,otherIndex]
//            }
//
//            numbersDict[value] = index
//        }
        
        // 1,3,4,6,7,8,10
        for (index,value) in numbers.enumerated(){
            let compliment = target - value
            if let indexx = numbersDict[compliment]{
                return [indexx,index]
            }
            numbersDict[value] = index
        }
                      
        return [0,0]
    }
    
    
    // MARK: -  Return a boolean if there are two numbers in array that equals to a provided sum
    func byNaiveApproach(arr:[Int],num:Int) -> Bool {
    
        var result = false
        
        for i in 0..<arr.count{
            for j in 0..<arr.count where j != i{
                if arr[j] + arr[i] == num{
                    result = true
                }else{
                    
                }
            }
        }
        
        return result
    }
             
              
    // MARK: -  Merge Sort
    
    func mergeSort(arr:[Int]) -> [Int]{
        guard arr.count > 1 else {return arr}
        var leftArray = Array(arr[0..<arr.count/2])
        var rightArray = Array(arr[arr.count/2..<arr.count])
        return merge(leftarr: mergeSort(arr: leftArray), rightarr: mergeSort(arr: rightArray))
    }
    
    func merge(leftarr:[Int],rightarr:[Int]) -> [Int]{
        var merged = [Int]()
        var left = leftarr
        var right = rightarr
        while left.count > 0 && right.count > 0{
            if left.first! < right.first!{
                merged.append(left.removeFirst())
            }else{
                merged.append(right.removeFirst())
            }
        }
        return merged + left + right
    }
   
                            
    
    fileprivate func findCommon(arr:[String]) -> String{
        var dict = [String:Int]()
        var mostcommon = ""
        for item in arr{
            if let count = dict[item]{
                dict[item] = count + 1
            }else{
                dict[item] = 1
            }
        }
        
        /*
         if let (value, count) = dict.max(by: { $0.1 < $1.1 }) {
                 print("value - \(value) occured \(count) times")
             }
         */
        
        let sorteddict = dict.sorted {$0.1 < $1.1}
        print("most common element is",sorteddict.last?.key)
        return mostcommon
    }
    
    
    fileprivate func checkNumberExist(arr:[Int],num:Int) -> Bool{
       var leftIndex = 0
        var rightindex = arr.count - 1
        while leftIndex <= rightindex{
            let middleIndex = (leftIndex + rightindex) / 2
            let middleValue = arr[middleIndex]
            
            if middleValue == num{
                return true
            }
            
            if middleValue < num{
                rightindex = middleIndex - 1
            }else{
                leftIndex = middleIndex + 1
            }
            
        }
        return false
    }
    
    
    private func mostCommonElement(array:[String]) -> String{
        var mostCommonElement = ""
        var elementDict = [String:Int]()
        for name in array{
            if let count = elementDict[name]{
                elementDict[name] = count + 1
            }else{
                elementDict[name] = 1
            }
        }
        
        let sorteddict = elementDict.sorted{ $0.1 < $1.1 }
        print("most common element is",sorteddict.last?.key)
        print("dICT IS", elementDict)
        return mostCommonElement
    }
    
    
    private func binarySearch(arr:[Int],num:Int) -> Bool{
        var leftIndex = 0
        var rightIndex = arr.count - 1
        
        while leftIndex <= rightIndex{
            var middleIndex = (leftIndex + rightIndex)/2
            let middlevalue = arr[middleIndex]
            print("middlevalue is",middlevalue)
            if middlevalue == num{
                return true
            }
            
            if num < middlevalue{
                rightIndex = middleIndex - 1
            }
            
            if num > middlevalue{
                leftIndex = middleIndex + 1
            }
        }
        
        return false
    }
    
    private func binarySearchWithSorting(array:[Int],num:Int) -> Bool {
        
        let sortedArr = array.sorted(by: >)
        print("Sorted Array is",sortedArr)
        var leftindex = 0
        var rightindex = sortedArr.count - 1
        while leftindex <= rightindex{
            var middleindex = (leftindex + rightindex) / 2
            let middlevalue = sortedArr[middleindex]
            print("middle value",middlevalue)
            if middlevalue == num{
                return true
            }
            if num < middlevalue{
                leftindex = middleindex + 1

            }
            
            if num > middlevalue{
                rightindex = middleindex - 1
            }
        }
        return false
    }
   

}

