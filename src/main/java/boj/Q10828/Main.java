package boj.Q10828;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.StringTokenizer;

public class Main {
    static Deque<Integer> stack = new ArrayDeque<>();

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        final int N = Integer.parseInt(st.nextToken());

        for (int i = 0; i < N; i++) {
            st = new StringTokenizer(br.readLine());
            String command = st.nextToken();
            command(command, st);
        }
    }

    private static void command(String command, StringTokenizer st) {
        if (command.equals("push")) {
            int X = Integer.parseInt(st.nextToken());
            stack.addLast(X);
            return;
        }

        if (command.equals("top")) {
            if (checkEmpty()) {
                return;
            }
            System.out.println(stack.getLast());
            return;

        }

        if (command.equals("size")) {
            System.out.println(stack.size());
            return;

        }

        if ("empty".equals(command)) {
            if (stack.isEmpty()) {
                System.out.println(1);
            } else {
                System.out.println(0);
            }
            return;
        }

        if (command.equals("pop")) {
            if (checkEmpty()) {
                return;
            }
            System.out.println(stack.pollLast());
            return;
        }
    }

    private static boolean checkEmpty() {
        if (stack.isEmpty()) {
            System.out.println(-1);
            return true;
        }
        return false;
    }

}
