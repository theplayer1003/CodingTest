package boj.Q5430;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int T = Integer.parseInt(br.readLine());

        Deque<Integer> deque = new ArrayDeque<>();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < T; i++) {
            char[] order = br.readLine().toCharArray();
            int arySize = Integer.parseInt(br.readLine());
            String aryData = br.readLine();
            aryData = aryData.replace("[", "");
            aryData = aryData.replace("]", "");
            String[] split = aryData.split(",");

            for (int j = 0; j < arySize; j++) {
                deque.offerLast(Integer.parseInt(split[j]));
            }

            for (int j = 0; j < order.length; j++) {
                if (order[j] == 'R') {
                    if (deque.isEmpty()) {
                        sb.append("error").append("\n");
                        break;
                    }
                    deque = deque.reversed();
                }

                if (order[j] == 'D') {
                    if (deque.isEmpty()) {
                        sb.append("error").append("\n");
                        break;
                    }
                    deque.pollFirst();
                }
            }

            if (!deque.isEmpty()) {
                sb.append("[");
                while (!deque.isEmpty()) {
                    sb.append(deque.pollFirst()).append(",");
                }
                sb.deleteCharAt(sb.length() - 1);
                sb.append("]").append("\n");
            }

        }

        System.out.println(sb);
    }
}
