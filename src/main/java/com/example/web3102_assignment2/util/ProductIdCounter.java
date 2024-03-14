package com.example.web3102_assignment2.util;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

public class ProductIdCounter {
    public static Map<Integer, Integer> countProductIds(List<Integer> productIds) {
        Map<Integer, Integer> countMap = new HashMap<>();

        // Iterate through the list of productIds, update the count for each productId
        // productId is the key, count is the value
        for(Integer productId : productIds){
            countMap.put(productId, countMap.getOrDefault(productId, 0) + 1);
        }
        return countMap;
    }
    public static int countOccurrences(int numToCount, List<Integer> integers) {
        int count = 0;

        // Iterate through the list of integers
        for (int num : integers) {
            // If the current integer matches the one to be counted, increment count
            if (num == numToCount) {
                count++;
            }
        }

        return count;
    }
}
