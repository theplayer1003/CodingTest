package boj.Q1021;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.LinkedList;
import java.util.List;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        LinkedList<Integer> deque = new LinkedList<>();

        int N = Integer.parseInt(st.nextToken());
        int M = Integer.parseInt(st.nextToken());

        for (int i = 0; i < N; i++) {
            deque.offerLast(i + 1);
        }

        int count = 0;
        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < M; i++) {
            int head = 0;
            int tail = deque.size();
            int currentTarget = Integer.parseInt(st.nextToken());
            int currentIndex = deque.indexOf(currentTarget);

            int fromHead = Math.abs(currentIndex - head);
            int fromTail = Math.abs(currentIndex - tail);

            if (fromHead <= fromTail) {
                for (int j = 0; j < fromHead; j++) {
                    deque.offerLast(deque.pollFirst());
                    count++;
                }
                deque.pollFirst();
            } else {
                for (int j = 0; j < fromTail; j++) {
                    deque.offerFirst(deque.pollLast());
                    count++;
                }
                deque.pollFirst();
            }
        }

        System.out.println(count);
    }
}
