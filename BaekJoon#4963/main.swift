//
//  main.swift
//  BaekJoon#4963
//
//  Created by 김병엽 on 2023/01/12.
//
// Reference: https://icksw.tistory.com/135

import Foundation

func solution() {
    let dx = [0,0,-1,1,-1,1,-1,1]
    let dy = [-1,1,0,0,-1,-1,1,1]
    var result = [Int]()
    
    while (true) {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        if nm == [0, 0] { break }
        
        let width = nm[0]
        let height = nm[1]
        
        var map = [[Int]]()
        for _ in 0..<height {
            map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }
        
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
        var count = 0
        
        func dfs(_ x: Int, _ y: Int) {
            for i in 0..<dx.count {
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx < 0 || nx > width-1 || ny < 0 || ny > height-1 {
                    continue
                } else {
                    if !visited[ny][nx] && map[ny][nx] == 1 {
                        visited[ny][nx] = true
                        dfs(nx,ny)
                    }
                }
            }
        }
        
        for i in 0..<height {
            for j in 0..<width {
                if map[i][j] == 1 && !visited[i][j] {
                    visited[i][j] = true
                    dfs(j,i)
                    count += 1
                }
            }
        }
        result.append(count)
    }
    
    for x in result {
        print(x)
    }
}

solution()
