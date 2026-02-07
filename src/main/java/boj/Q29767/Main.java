package boj.Q29767;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        final BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());
        int K = Integer.parseInt(st.nextToken());

        long[] classroom = new long[N];

        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < N; i++) {
            classroom[i] = Long.parseLong(st.nextToken());
        }

        for (int i = 1; i < N; i++) {
            classroom[i] += classroom[i - 1];
        }

        Arrays.sort(classroom);

        long answer = 0;
        for (int i = 0; i < K; i++) {
            answer += classroom[N - 1 - i];
        }

        System.out.println(answer);
    }
}
