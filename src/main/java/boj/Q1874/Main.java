package boj.Q1874;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        final int n = Integer.parseInt(br.readLine());
        Deque<Integer> stack = new ArrayDeque<>();

        int cur = 1;

        for (int i = 0; i < n; i++) {
            int number = Integer.parseInt(br.readLine());

            while (cur <= number) {
                stack.offerLast(cur);
                cur += 1;
                sb.append("+\n");
            }

            if (stack.peekLast() == number) {
                stack.pollLast();
                sb.append("-\n");
                continue;
            }

            if (stack.peekLast() != number) {
                System.out.println("NO");
                return;
            }
        }

        System.out.println(sb);
    }
}
