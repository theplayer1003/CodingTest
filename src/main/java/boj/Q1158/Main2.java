package boj.Q1158;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class Main2 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());
        int K = Integer.parseInt(st.nextToken());

        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < N; i++) {
            list.add(i + 1);
        }

        StringBuilder sb = new StringBuilder();
        sb.append('<');

        int index = 0;
        /*
        0 -> (0 + 3 - 1) % 7 -> 2
        2 -> (2 + 3 - 1) % 6 -> 4
         */

        while (!list.isEmpty()) {
            index = (index + K - 1) % list.size();

            sb.append(list.remove(index));

            if (!list.isEmpty()) {
                sb.append(", ");
            }
        }
    }
}
/*
index

K번째 사람을 지목해야한다.
index(시작점) + K - 1
원형 연결, 모듈러
(index + K - 1) % size -> size 를 안 넘어가면서 순환
 */
