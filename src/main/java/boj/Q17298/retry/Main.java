package boj.Q17298.retry;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Deque;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        Deque<Pair> monostack = new ArrayDeque<>();
        StringBuilder sb = new StringBuilder();

        int N = Integer.parseInt(st.nextToken());

        int[] ans = new int[N];
//        for (int i = 0; i < N; i++) {
//            ans[i] = -1;
//        } 반복문 초기화 대신 메서드 사용, 가독성과 성능에서 유리
        Arrays.fill(ans, -1);

        st = new StringTokenizer(br.readLine());

        for (int i = 0; i < N; i++) {
            int now = Integer.parseInt(st.nextToken());

            while (!monostack.isEmpty() && monostack.peekLast().number() < now) {
                Pair pop = monostack.pollLast();
                ans[pop.index()] = now;
            }

            monostack.offerLast(new Pair(now, i));
        }

        for (int ansNumber : ans) {
            //sb.append(ansNumber + " "); + 연산 쓰면 성능 저하. 내부적으로 새로운 임시 sb 를 만들어 처리함
            sb.append(ansNumber).append(" "); // 이렇게 체이닝 하자
        }
        sb.deleteCharAt(sb.length() - 1);

        System.out.println(sb);
    }

    static class Pair {
        private final int number;
        private final int index;

        public Pair(int number, int index) {
            this.number = number;
            this.index = index;
        }

        public int number() {
            return number;
        }

        public int index() {
            return index;
        }
    }
}


/*
9 5 4 8
9
9 5
9 5 4
9 5 4 8 -> 9 5, 8 ->
 */
