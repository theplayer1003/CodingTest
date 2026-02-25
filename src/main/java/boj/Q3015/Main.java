package boj.Q3015;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        Deque<Pair> monostack = new ArrayDeque<>();
        long answer = 0;

        int N = Integer.parseInt(br.readLine());

        for (int i = 0; i < N; i++) {
            long currentHeight = Long.parseLong(br.readLine());

            while (monostack.peekLast().height() <= currentHeight) {

                if (!monostack.isEmpty() && monostack.peekLast().height() == currentHeight) {
                    final Pair pop = monostack.pop();
                    monostack.offerLast(new Pair(currentHeight, pop.sameHeightCount()));
                }

                if (!monostack.isEmpty() && monostack.peekLast().height() < currentHeight) {
                    final Pair pop = monostack.pop();
                    answer += pop.sameHeightCount();
                }
            }

            monostack.offerLast(new Pair(currentHeight, ));
        }

        System.out.println(answer);
    }
}

record Pair(long height, int sameHeightCount) {
}

/*
7, 2 4 1 2 2 5 1

스택의 top 과 비교해서 만약 자기보다 작으면 = 앞으로 뒤에 들어올 녀석들과 볼 수 없으면, 꺼내서 버리기.

키가 같은 경우를 처리하기 위해 연속된 값이 몇 개 있었는지 같이 보관하기

 */
