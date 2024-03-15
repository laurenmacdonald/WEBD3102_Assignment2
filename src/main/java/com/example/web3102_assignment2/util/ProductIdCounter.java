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
}
