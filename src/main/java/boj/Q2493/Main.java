package boj.Q2493;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        Deque<int[]> stack = new ArrayDeque<>();
        StringBuilder sb = new StringBuilder();

        int N = Integer.parseInt(st.nextToken());
        st = new StringTokenizer(br.readLine());

        for (int i = 1; i <= N; i++) {
            int topSize = Integer.parseInt(st.nextToken());

            while (!stack.isEmpty() && stack.peekLast()[0] < topSize) {
                stack.pollLast();
            }

            if (stack.isEmpty()) {
                sb.append("0 ");
            } else {
                sb.append(stack.peekLast()[1] + " ");
            }

            stack.offerLast(new int[]{topSize, i});
        }
        System.out.println(sb);
    }
}
/*
6 9 5 7 4 8 10

 */
