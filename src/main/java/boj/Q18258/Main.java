package boj.Q18258;

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

        int N = Integer.parseInt(st.nextToken());

        Deque<Integer> que = new ArrayDeque<>();

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < N; i++) {
            st = new StringTokenizer(br.readLine());
            String command = st.nextToken();

            switch (command) {
                case "push":
                    que.offerLast(Integer.parseInt(st.nextToken()));
                    break;
                case "front":
                    if (que.isEmpty()) {
                        sb.append(-1).append("\n");
                        continue;
                    }
                    sb.append(que.peekFirst()).append("\n");
                    break;
                case "back":
                    if (que.isEmpty()) {
                        sb.append(-1).append("\n");
                        continue;
                    }
                    sb.append(que.peekLast()).append("\n");
                    break;
                case "size":
                    sb.append(que.size()).append("\n");
                    break;
                case "empty":
                    if (que.isEmpty()) {
                        sb.append(1).append("\n");
                    } else {
                        sb.append(0).append("\n");
                    }
                    break;
                case "pop":
                    if (que.isEmpty()) {
                        sb.append(-1).append("\n");
                        continue;
                    }
                    sb.append(que.pollFirst()).append("\n");
                    break;
            }

        }

        System.out.println(sb);
    }
}
/*
사실 출제 의도는 배열을 통해 큐를 구현하라는 것.
Deque의 구현체가 ArrayDeque 라 자연스럽게 통과됨.
 */
