package boj.Q29767;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.PriorityQueue;
import java.util.StringTokenizer;

public class Main2 {
    public static void main(String[] args) throws IOException {
        final BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());
        int K = Integer.parseInt(st.nextToken());

        PriorityQueue<Long> pq = new PriorityQueue<>();

        long currentSum = 0;
        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < N; i++) {
            currentSum += Long.parseLong(st.nextToken());

            pq.offer(currentSum);

            if (pq.size() > K) {
                pq.poll();
            }
        }

        long answer = 0;
        for (Long score : pq) {
            answer += score;
        }

        System.out.println(answer);
    }
}
