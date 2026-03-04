package boj.Q10845;

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

        for (int i = 0; i < N; i++) {
            st = new StringTokenizer(br.readLine());
            String command = st.nextToken();

            if (command.equals("push")) {
                int data = Integer.parseInt(st.nextToken());
                que.offerLast(data);
            }

            if (command.equals("front")) {
                if (que.isEmpty()) {
                    System.out.println(-1);
                    continue;
                }
                System.out.println(que.peekFirst());
            }

            if (command.equals("back")) {
                if (que.isEmpty()) {
                    System.out.println(-1);
                    continue;
                }
                System.out.println(que.peekLast());
            }

            if (command.equals("size")) {
                System.out.println(que.size());
            }

            if (command.equals("empty")) {
                if (que.isEmpty()) {
                    System.out.println(1);
                } else {
                    System.out.println(0);
                }
            }

            if (command.equals("pop")) {
                if (que.isEmpty()) {
                    System.out.println(-1);
                    continue;
                }
                System.out.println(que.pollFirst());
            }
        }
    }
}
/*
Queue
First in First Out
 */