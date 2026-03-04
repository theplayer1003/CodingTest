package boj.Q2164;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());

        Deque<Integer> que = new ArrayDeque<>();
        for (int i = 1; i <= N; i++) {
            que.offerLast(i);
        }

        while(que.size() != 1) {
            que.pollFirst();
            que.offerLast(que.pollFirst());
        }

        System.out.println(que.peekLast());
    }
}
