package boj.Q1655;

import java.util.Collections;
import java.util.PriorityQueue;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        final Scanner s = new Scanner(System.in);
        final int N = s.nextInt();

        final PriorityQueue<Integer> minHeap = new PriorityQueue<>();
        final PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());

        for (int i = 0; i < N; i++) {
            final int number = s.nextInt();

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
/*
1, 5, 2, 10, -99, 7, 5

최대 힙
    10
  5    7
1 -99 2  5


최소 힙
   -99
  1    2
10 5 7  5
 */