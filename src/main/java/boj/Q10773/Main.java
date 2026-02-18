package boj.Q10773;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        final int K = Integer.parseInt(br.readLine());
        Deque<Integer> stack = new ArrayDeque<>();

        int answer = 0;

        for (int i = 0; i < K; i++) {
            int target = Integer.parseInt(br.readLine());

            if (target == 0) {
                stack.removeLast();
            }

            if (target != 0) {
                stack.offerLast(target);
                //answer += target;
            }
        }

//        while (!stack.isEmpty()) {
//            answer += stack.poll();
//        }

        for (Integer number : stack) {
            answer += number;
        }

        System.out.println(answer);
    }
}
