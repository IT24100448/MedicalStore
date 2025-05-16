package com.app.medicine.util;

import com.app.medicine.model.Medicine;

import java.util.*;

public class MedicineUtil {

    // Sort by category using Merge Sort
    public static List<Medicine> sortByCategory(List<Medicine> products) {
        if (products == null || products.size() <= 1) return products;
        int mid = products.size() / 2;
        List<Medicine> left = sortByCategory(new ArrayList<>(products.subList(0, mid)));
        List<Medicine> right = sortByCategory(new ArrayList<>(products.subList(mid, products.size())));
        return mergeByCategory(left, right);
    }

    private static List<Medicine> mergeByCategory(List<Medicine> left, List<Medicine> right) {
        List<Medicine> merged = new ArrayList<>();
        int i = 0, j = 0;
        while (i < left.size() && j < right.size()) {
            if (left.get(i).getCategory().compareToIgnoreCase(right.get(j).getCategory()) <= 0) {
                merged.add(left.get(i++));
            } else {
                merged.add(right.get(j++));
            }
        }
        while (i < left.size()) merged.add(left.get(i++));
        while (j < right.size()) merged.add(right.get(j++));
        return merged;
    }

    // Sort by price using Quick Sort
    public static List<Medicine> sortByPrice(List<Medicine> products) {
        if (products == null || products.size() <= 1) return products;
        List<Medicine> sortedList = new ArrayList<>(products);
        quickSortByPrice(sortedList, 0, sortedList.size() - 1);
        return sortedList;
    }

    private static void quickSortByPrice(List<Medicine> list, int low, int high) {
        if (low < high) {
            int pi = partition(list, low, high);
            quickSortByPrice(list, low, pi - 1);
            quickSortByPrice(list, pi + 1, high);
        }
    }

    private static int partition(List<Medicine> list, int low, int high) {
        double pivot = list.get(high).getPrice();
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (list.get(j).getPrice() <= pivot) {
                i++;
                Collections.swap(list, i, j);
            }
        }
        Collections.swap(list, i + 1, high);
        return i + 1;
    }
}
