package boj.Q6198;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        Deque<Integer> stack = new ArrayDeque<>();

        int N = Integer.parseInt(br.readLine());

        long answer = 0;
        for (int i = 0; i < N; i++) {
            int height = Integer.parseInt(br.readLine());

            while (!stack.isEmpty() && stack.peekLast() <= height) {
                stack.pollLast();
            }

            answer += stack.size();

            stack.offerLast(height);
        }

        System.out.println(answer);
    }
}


/*
자료구조 활용 정리하기
 */