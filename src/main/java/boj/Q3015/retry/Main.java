package boj.Q3015.retry;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());
        long[] ary = new long[N];

//        for (int i = 0; i < N; i++) {
//            ary[i] = Long.parseLong(br.readLine());
//        }

        Deque<long[]> monoStack = new ArrayDeque<>();
        for (int i = 0; i < N; i++) {
            long current = Long.parseLong(br.readLine());

            monoStack.offerLast(new long[]{current, monoStack.size()});

        }
    }
}
/*
2 4 1 2 2 5 1

재시도 실패
 */
