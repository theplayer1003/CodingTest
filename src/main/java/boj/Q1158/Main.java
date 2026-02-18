package boj.Q1158;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        final int N = Integer.parseInt(st.nextToken());
        final int K = Integer.parseInt(st.nextToken());

        Queue<Integer> que = new ArrayDeque<>();

        for (int i = 0; i < N; i++) {
            que.offer(i + 1);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("<");

        while (!que.isEmpty()) {
            for (int i = 0; i < K - 1; i++) {
                que.offer(que.poll());
            }

            sb.append(que.poll());
            sb.append(", ");
        }

        sb.deleteCharAt(sb.length() - 1);
        sb.deleteCharAt(sb.length() - 1);
        sb.append(">");
        System.out.println(sb);
    }
}

/*
7 3 -> N명 7명, K번 3번

1,2,3,4,5,6,7
->3
1,2,_,4,5,6,7
->6
1,2,_,4,5,_,7
->2
1,_,_,4,5,_,7
->7
1,_,_,4,5,_,_
->5
->1
->4

3626147
 */

/*
 sb.deleteCharAt() 으로 두번 빼는 대신
 while(que.size() > 1) 로 하나 남기고 남은 하나 따로 처리하기
 */

/*
 세그먼트 트리?
 */