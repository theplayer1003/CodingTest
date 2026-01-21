package boj.Q1655;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.PriorityQueue;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws IOException {
        final BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        final StringBuilder sb = new StringBuilder();

        final int N = Integer.parseInt(br.readLine());

        final PriorityQueue<Integer> minHeap = new PriorityQueue<>();
        final PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());

        for (int i = 0; i < N; i++) {
            final int number = Integer.parseInt(br.readLine());

            if (maxHeap.size() == minHeap.size()) {
                maxHeap.offer(number);
            } else {
                minHeap.offer(number);
            }

            if (!minHeap.isEmpty() && maxHeap.peek() > minHeap.peek()) {
                final Integer maxValue = maxHeap.poll();
                final Integer minValue = minHeap.poll();

                maxHeap.offer(minValue);
                minHeap.offer(maxValue);
            }

            System.out.println(maxHeap.peek());
        }
    }
}
