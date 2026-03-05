package boj.Q10866;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());

        int[] deque = new int[20002];
        int head = 20002 / 2;
        int tail = head - 1;

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < N; i++) {
            st = new StringTokenizer(br.readLine());
            String cmd = st.nextToken();

            switch (cmd) {
                case "push_back":
                    tail++;
                    deque[tail] = Integer.parseInt(st.nextToken());
                    break;
                case "push_front":
                    head--;
                    deque[head] = Integer.parseInt(st.nextToken());
                    break;
                case "front":
                    if (tail < head) {
                        sb.append(-1).append("\n");
                        continue;
                    }
                    sb.append(deque[head]).append("\n");
                    break;
                case "back":
                    if (tail < head) {
                        sb.append(-1).append("\n");
                        continue;
                    }
                    sb.append(deque[tail]).append("\n");
                    break;
                case "size":
                    sb.append(tail - head + 1).append("\n");
                    break;
                case "empty":
                    if (tail < head) {
                        sb.append(1).append("\n");
                    } else {
                        sb.append(0).append("\n");
                    }
                    break;
                case "pop_front":
                    if (tail < head) {
                        sb.append(-1).append("\n");
                        continue;
                    }
                    sb.append(deque[head]).append("\n");
                    head++;
                    break;
                case "pop_back":
                    if (tail < head) {
                        sb.append(-1).append("\n");
                        continue;
                    }
                    sb.append(deque[tail]).append("\n");
                    tail--;
                    break;
            }

        }
        System.out.println(sb);
    }
}
